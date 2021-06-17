const SLEEP = require("await-sleep");
var CLUI = require("clui");
var MONGO_DB = require("./persistent/mongo");
var REDIS = require("./persistent/redis");
var GAUGE = CLUI.Gauge;

const MARIADB = require("mariadb");
const { ObjectId } = require("mongodb");
const { encryptObject, decryptObject } = require("./encryption");
var MOMENT = require("moment");

const MARIADB_POOL = MARIADB.createPool({
	host: "mdb-zinfw-dev.mariadb.database.azure.com",
	port: 3306,
	user: "dspapp@mdb-zinfw-dev",
	password: "!dspapp00",
	database: "mngr",
	connectionLimit: 5,
});

var ENV = {
	REDIS: {
		PORT: process.env.REDIS_PORT,
		WEATHERDB: process.env.REDIS_WEATHER_DB,
		PLACEDB: process.env.REDIS_PLACE_DB,
		DEV: {
			HOST: process.env.DEV_REDIS_HOST,
			PASSWORD: process.env.DEV_REDIS_PASSWORD,
		},
		PRD: {
			HOST: process.env.PRD_REDIS_HOST,
			PASSWORD: process.env.PRD_REDIS_PASSWORD,
		},
	},
	MONGO_DB: {
		DEV: {
			ID: "dev",
			URI: process.env.DEV_MONGO_URI,
			DB_NAME: process.env.DEV_DB_NAME,
		},
		PRD: {
			ID: "prd",
			URI: process.env.PRD_MONGO_URI,
			DB_NAME: process.env.PRD_DB_NAME,
		},
	},
};

main();

async function main() {
	// MONGO DB
	// await startClearDevRedis();

	await initMongoDb();
	await startMongoDbMigrationPrdToDev();

	// REDIS
	// await startRedisMigration();

	process.exit(1);
}

async function startClearDevRedis() {
	console.debug(`========================================`);
	console.debug(`Start Redis`);

	let targetDbList = [4]; // 0:SpringSession, 3:우편번호, 4:날씨, 5:모바일 AccessToken
	for (const targetDb of targetDbList) {
		var redisTarget = require("redis");
		let redisTargetClient = await redisTarget.createClient(ENV.REDIS.PORT, ENV.REDIS.DEV.HOST, { auth_pass: ENV.REDIS.DEV.PASSWORD, db: targetDb, tls: { servername: ENV.REDIS.DEV.HOST } });

		await redisTargetClient.keys("*", async function (err, keys) {
			if (err) return console.log(err);

			for (var i = 0, len = keys.length; i < len; i++) {
				console.debug(GAUGE(i, keys.length, 40, keys.length, i + "/" + keys.length));
				await redisTargetClient.delAsync(keys[i]);
			}
		});
	}
	console.debug(`Done!`);
}

async function startRedisMigration() {
	console.debug(`========================================`);
	console.debug(`Start Redis`);

	let targetDbList = [5]; // 0:SpringSession, 3:우편번호, 4:날씨, 5:모바일 AccessToken
	for (const targetDb of targetDbList) {
		var redisSource = require("redis"),
			redisSourceClient = await redisSource.createClient(ENV.REDIS.PORT, ENV.REDIS.DEV.HOST, { auth_pass: ENV.REDIS.DEV.PASSWORD, db: targetDb, tls: { servername: ENV.REDIS.DEV.HOST } });

		var redisTarget = require("redis"),
			redisTargetClient = await redisSource.createClient(ENV.REDIS.PORT, ENV.REDIS.PRD.HOST, { auth_pass: ENV.REDIS.PRD.PASSWORD, db: targetDb, tls: { servername: ENV.REDIS.DEV.HOST } });

		await redisSourceClient.keys("*", async function (err, keys) {
			if (err) return console.log(err);

			for (var i = 0, len = keys.length; i < len; i++) {
				console.debug(GAUGE(i, keys.length, 40, keys.length, i + "/" + keys.length));
				let value = await redisSourceClient.getAsync(keys[i]);
				await redisTargetClient.setAsync(keys[i], value);
				// console.log(value + ", " + keys[i]);
			}
		});
	}
	console.debug(`Done!`);
}

async function initMongoDb() {
	MONGO_DB.setEnv(ENV.MONGO_DB.DEV.ID, ENV.MONGO_DB.DEV.URI, ENV.MONGO_DB.DEV.DB_NAME);
	await MONGO_DB.init(ENV.MONGO_DB.DEV.ID);

	MONGO_DB.setEnv(ENV.MONGO_DB.PRD.ID, ENV.MONGO_DB.PRD.URI, ENV.MONGO_DB.PRD.DB_NAME);
	await MONGO_DB.init(ENV.MONGO_DB.PRD.ID);
}

async function startMongoDbMigrationPrdToDev() {
	console.debug(`========================================`);
	console.debug(`Start MongoDb`);
	try {
		let items;
		let totalCount;
		const targetCollection = "users";

		// insert to target collection
		totalCount = await MONGO_DB.count(ENV.MONGO_DB.DEV.ID, targetCollection, {});
		items = await MONGO_DB.find(ENV.MONGO_DB.DEV.ID, targetCollection, {});
		console.debug(`========================================`);
		console.debug(`insert targetCollection : ${targetCollection}`);
		count = 0;
		for (const item of items) {
			count++;
			console.debug(GAUGE(count, totalCount, 40, totalCount, count + "/" + totalCount));
			try {
				console.log(JSON.stringify(item));
				await insertUserFromMariaDb(item);
				// await MONGO_DB.insert(ENV.MONGO_DB.DEV.ID, targetCollection, item);
				// await SLEEP(20);
			} catch (error) {}
		}
	} catch (error) {
		console.debug(`error! : ${error}`);
	}
	console.debug(`Done!`);
}

async function insertUserFromMariaDb(userJson) {
	let connection, rows;
	try {
		// init
		if (!userJson.appLogin) userJson.appLogin = {};
		if (!userJson.appLogin.site) userJson.appLogin.site = "";
		if (!userJson.appLogin.openId) userJson.appLogin.openId = "";
		if (!userJson.appLogin.profileImage) userJson.appLogin.profileImage = "";
		if (!userJson.appLogin.email) userJson.appLogin.email = "";
		if (!userJson.nickname) userJson.nickname = "";
		if (!userJson.userCode) userJson.userCode = "";
		if (!userJson.status) userJson.status = "";
		userJson.status = "active";

		// get now for mariaDb timestamp
		var now = MOMENT(Date.now()).format("YYYY-MM-DD HH:mm:ss");

		// make query string
		let queryString = "";
		queryString = queryString.concat(
			`INSERT INTO tb_zin_users (`,
			`_id, appLogin_site, appLogin_openId, appLogin_profileImage, appLogin_email, nickname, userCode, lastAccessedAt, lastUpdatedAt, activatedAt, status, json`,
			`) VALUES (`,
			`'${userJson._id}', `,
			`'${userJson.appLogin.site}', `,
			`'${userJson.appLogin.openId}', `,
			`'${userJson.appLogin.profileImage}', `,
			`'${userJson.appLogin.email}', `,
			`'${userJson.nickname}', `,
			`'${userJson.userCode}', `,
			`'${now}', `,
			`'${now}', `,
			`'${now}', `,
			`'${userJson.status}', `,
			`'${encryptObject(userJson)}'`,
			`)`
		);

		// query
		connection = await MARIADB_POOL.getConnection();
		rows = await connection.query(queryString);
	} catch (err) {
		console.log(err);
		throw err;
	} finally {
		if (connection) connection.release();
		return rows;
	}
}
