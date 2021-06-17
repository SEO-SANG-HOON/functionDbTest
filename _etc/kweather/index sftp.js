var CLUI = require("clui");
var REDIS = require("./persistent/redis");
var CONSTANTS = require("./constants");
var GAUGE = CLUI.Gauge;

const FS = require("fs");
const JSON_STREAM = require("JSONStream");
const FTP_CONNECTION_STRING = {
	host: CONSTANTS.SFTP.HOST,
	port: CONSTANTS.SFTP.PORT,
	username: CONSTANTS.SFTP.USER,
	password: CONSTANTS.SFTP.PASSWORD,
};
const SFTP_CLIENT = require("ssh2-sftp-client");

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
};

main();

async function main() {
	let remotePath = "/home/jys129/test/";
	let dest = "c:/temp/";
	let targetFileList = ["SHKO", "AIR_POLLUTION", "LIFESTYLE"];

	for (const targetFile of targetFileList) {
		await downloadFile(remotePath, targetFile, dest);
	}
}

// npm install --save ssh2-sftp-client
// https://www.npmjs.com/package/ssh2-sftp-client
// https://github.com/theophilusx/ssh2-sftp-client

// npm install --save JSONStream
async function downloadFile(remotePath, fileNameSeed, dest) {
	// init
	let dateString = "_20200830"; // will be generated
	let sftp = new SFTP_CLIENT();
	let fileName = fileNameSeed + dateString + CONSTANTS.SFTP.FILE_EXT;

	// start
	await sftp
		.connect(FTP_CONNECTION_STRING)
		.then(() => {
			// download file
			return sftp.fastGet(remotePath + fileName, dest + fileName);
		})
		.then((data) => {
			// close ftp
			sftp.end();

			// parse json
			let count = 0;
			var stream = FS.createReadStream(dest + fileName, { encoding: "utf8" });
			stream.pipe(
				JSON_STREAM.parse("*", async function (obj) {
					// loop json array
					count++;
					console.debug(GAUGE(count, 3775, 40, count, fileName + " : " + count + "/" + 3775));
					await handleJson(obj);
				})
			);
		})
		.catch((err) => {
			console.log(err, "catch error");
		});
}

async function handleJson(obj) {
	console.log(JSON.stringify(obj)); // whatever you will do with each JSON object
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
			}
		});
	}
	console.debug(`Done!`);
}
