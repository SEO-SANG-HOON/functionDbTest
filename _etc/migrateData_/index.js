const SLEEP = require("await-sleep");
var CLUI = require("clui");
var MONGO_DB = require("./persistent/mongo");
var REDIS = require("./persistent/redis");

const { ObjectId } = require("mongodb");
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
	// await initMongoDb();
	// await startMongoDbMigration();
	// REDIS
	// await startRedisMigration();
	await startClearRedis();
	process.exit(1);
}

async function startClearRedis() {
	console.debug(`========================================`);
	console.debug(`Start Redis`);
	var Gauge = CLUI.Gauge;

	let targetDbList = [4]; // 0:SpringSession, 3:우편번호, 4:날씨, 5:모바일 AccessToken
	for (const targetDb of targetDbList) {
		var redisTarget = require("redis");
		let redisTargetClient = await redisTarget.createClient(ENV.REDIS.PORT, ENV.REDIS.PRD.HOST, { auth_pass: ENV.REDIS.PRD.PASSWORD, db: targetDb, tls: { servername: ENV.REDIS.DEV.HOST } });

		await redisTargetClient.keys("*", async function (err, keys) {
			if (err) return console.log(err);

			for (var i = 0, len = keys.length; i < len; i++) {
				console.debug(Gauge(i, keys.length, 40, keys.length, i + "/" + keys.length));
				await redisTargetClient.delAsync(keys[i]);
			}
		});
	}
	console.debug(`Done!`);
}

async function startRedisMigration() {
	console.debug(`========================================`);
	console.debug(`Start Redis`);
	var Gauge = CLUI.Gauge;

	let targetDbList = [5]; // 0:SpringSession, 3:우편번호, 4:날씨, 5:모바일 AccessToken
	for (const targetDb of targetDbList) {
		var redisSource = require("redis"),
			redisSourceClient = await redisSource.createClient(ENV.REDIS.PORT, ENV.REDIS.DEV.HOST, { auth_pass: ENV.REDIS.DEV.PASSWORD, db: targetDb, tls: { servername: ENV.REDIS.DEV.HOST } });

		var redisTarget = require("redis"),
			redisTargetClient = await redisSource.createClient(ENV.REDIS.PORT, ENV.REDIS.PRD.HOST, { auth_pass: ENV.REDIS.PRD.PASSWORD, db: targetDb, tls: { servername: ENV.REDIS.DEV.HOST } });

		await redisSourceClient.keys("*", async function (err, keys) {
			if (err) return console.log(err);

			for (var i = 0, len = keys.length; i < len; i++) {
				console.debug(Gauge(i, keys.length, 40, keys.length, i + "/" + keys.length));
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

async function startMongoDbMigration() {
	console.debug(`========================================`);
	console.debug(`Start MongoDb`);
	//let targetCollectionList = ["boards", "deviceTypes", "settings", "devices", "places", "users"];
	let targetCollectionList = ["thinqTokens"]; // TODO : 대상 collection을 추가
	let isDeleteTarget = false; // 이관 대상 collection을 초기화 할지 지정
	try {
		var Gauge = CLUI.Gauge;

		let items;
		let totalCount;
		for (const targetCollection of targetCollectionList) {
			// delete target collection
			if (isDeleteTarget) {
				totalCount = await MONGO_DB.count(ENV.MONGO_DB.PRD.ID, targetCollection, {});
				items = await MONGO_DB.find(ENV.MONGO_DB.PRD.ID, targetCollection, {});
				console.debug(`========================================`);
				console.debug(`delete targetCollection : ${targetCollection}`);
				count = 0;
				for (const item of items) {
					count++;
					//console.debug(`count : ${count} / ${totalCount}`);
					console.debug(Gauge(count, totalCount, 40, totalCount, count + "/" + totalCount));
					await MONGO_DB.del(ENV.MONGO_DB.PRD.ID, targetCollection, { _id: ObjectId(item._id) });
					// await SLEEP(20);
				}
			}

			// insert to target collection
			totalCount = await MONGO_DB.count(ENV.MONGO_DB.DEV.ID, targetCollection, {});
			items = await MONGO_DB.find(ENV.MONGO_DB.DEV.ID, targetCollection, {});
			console.debug(`========================================`);
			console.debug(`insert targetCollection : ${targetCollection}`);
			count = 0;
			for (const item of items) {
				count++;
				// delete item._id;
				//console.debug(`count : ${count} / ${totalCount}`);
				console.debug(Gauge(count, totalCount, 40, totalCount, count + "/" + totalCount));
				try {
					await MONGO_DB.insert(ENV.MONGO_DB.PRD.ID, targetCollection, item);
					// await SLEEP(20);
				} catch (error) {}
			}
		}
	} catch (error) {
		console.debug(`error! : ${error}`);
	}
	console.debug(`Done!`);
}
