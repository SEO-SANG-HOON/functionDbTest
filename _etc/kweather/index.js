const SLEEP = require("await-sleep");
var CLUI = require("clui");
var REDIS = require("./persistent/redis");
var CONSTANTS = require("./constants");
var GAUGE = CLUI.Gauge;

const FS = require("fs");
const JSON_STREAM = require("JSONStream");
const FTP_CLIENT = require("ftp");

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
	//let targetFileList = ["SHKO", "AIR_POLLUTION", "LIFESTYLE"];
	let targetFileList = ["SHKO"];

	// 다운로드는 순차적으로
	// for (const targetFile of targetFileList) {
	// 	let dateString = "_20200911"; // will be generated
	// 	let fileName = targetFile + dateString + CONSTANTS.SFTP.FILE_EXT;
	// 	await ftpDownload(CONSTANTS.SFTP.SOURCE_LOCATION, fileName, CONSTANTS.SFTP.DESC_LOCATION);
	// }

	// redis 저장은 병렬로 처리됨
	for (const targetFile of targetFileList) {
		let dateString = "_20200911"; // will be generated
		let fileName = targetFile + dateString + CONSTANTS.SFTP.FILE_EXT;
		await ParceJsonFile(CONSTANTS.SFTP.DESC_LOCATION + fileName);
	}
	console.log("finished!");
}

// npm install --save event-stream
async function ParceJsonFile(filePath) {
	const es = require("event-stream");
	var stream = FS.createReadStream(filePath, { encoding: "utf8" });
	stream.pipe(JSON_STREAM.parse("*")).pipe(
		es.through(async function (data) {
			this.pause();
			await handleJson(this, data);
		})
	);
	console.log("asyncParceJsonFile finished!");
}

async function handleJson(es, obj) {
	try {
		console.log(JSON.stringify(obj)); // whatever you will do with each JSON object
		///await MONGO_DB.insert(ENV.MONGO_DB.DEV.ID, TARGET_COLLECTION, area);
		// await MONGO_DB.insert(ENV.MONGO_DB.PRD.ID, TARGET_COLLECTION, area);
		await SLEEP(1000);
		es.resume();
	} catch (error) {
		console.log(error);
	}
}

// npm install --save ftp
// npm install --save JSONStream
function ftpDownload(remotePath, fileName, dest) {
	return new Promise(function (resolve, reject) {
		let ftp = new FTP_CLIENT();
		var fs = require("fs");
		let fileStream = fs.createWriteStream(dest + fileName);

		ftp.on("ready", async function () {
			ftp.get(remotePath + fileName, function (err, stream) {
				if (err) throw err;
				stream.once("close", function () {
					ftp.end();
					resolve();
				});
				stream.pipe(fileStream);
			});
		});
		ftp.connect(CONSTANTS.SFTP.CONFIG);
	});
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
