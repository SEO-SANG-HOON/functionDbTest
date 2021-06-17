var CLUI = require("clui");
var REDIS = require("redis");
const BLUEBIRD = require("bluebird");
BLUEBIRD.promisifyAll(REDIS.RedisClient.prototype);

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
	let targetDbList = [1, 2, 3, 4, 5, 6]; // 0:SpringSession, 1:Cache, 3:우편번호, 4:날씨, 5:모바일 AccessToken
	await startClearRedis("dev", targetDbList);
}

async function startClearRedis(type, targetDbList) {
	console.debug(`========================================`);
	console.debug(`Start Redis`);
	var Gauge = CLUI.Gauge;

	for (const targetDb of targetDbList) {
		var redisTarget = require("redis");

		let redisTargetClient;
		switch (type) {
			case "dev":
				redisTargetClient = await redisTarget.createClient(ENV.REDIS.PORT, ENV.REDIS.DEV.HOST, { auth_pass: ENV.REDIS.DEV.PASSWORD, db: targetDb, tls: { servername: ENV.REDIS.DEV.HOST } }); // DEV
				break;
			// case "prd":
			// 	redisTargetClient = await redisTarget.createClient(ENV.REDIS.PORT, ENV.REDIS.PRD.HOST, { auth_pass: ENV.REDIS.PRD.PASSWORD, db: targetDb, tls: { servername: ENV.REDIS.DEV.HOST } }); // PRD
			// 	break;
		}

		await redisTargetClient.keys("*", async function (err, keys) {
			if (err) return console.log(err);

			for (var i = 0, len = keys.length; i < len; i++) {
				console.debug(Gauge(i, keys.length, 40, keys.length, i + "/" + keys.length));
				await redisTargetClient.delAsync(keys[i]);
			}
		});
	}
	console.debug(`Done!`);
	//process.exit(1);
}
