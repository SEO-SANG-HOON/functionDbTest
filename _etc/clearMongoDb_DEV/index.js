// const SLEEP = require("await-sleep");
var CLUI = require("clui");
var MONGO_DB = require("./persistent/mongo");
var REDIS = require("./persistent/redis");

const { ObjectId } = require("mongodb");
var ENV = {
	REDIS: {
		PORT: process.env.REDIS_PORT,
		WEATHERDB: process.env.REDIS_WEATHER_DB,
		PLACEDB: process.env.REDIS_PLACE_DB,
		HOST: process.env.DEV_REDIS_HOST, // process.env.PRD_REDIS_HOST,
		PASSWORD: process.env.DEV_REDIS_PASSWORD, // process.env.PRD_REDIS_PASSWORD,
	},
	MONGO_DB: {
		URI: process.env.DEV_MONGO_URI, // process.env.PRD_MONGO_URI,
		DB_NAME: process.env.DEV_DB_NAME, // process.env.PRD_DB_NAME,
	},
};

main();

async function main() {
	await initMongoDb();
	await startClearDb();
}

async function initMongoDb() {
	MONGO_DB.setEnv(ENV.MONGO_DB.ID, ENV.MONGO_DB.URI, ENV.MONGO_DB.DB_NAME);
	await MONGO_DB.init(ENV.MONGO_DB.ID);
}

async function startClearDb() {
	console.debug(`========================================`);
	console.debug(`Start MongoDb`);
	//let targetCollectionList = ["boards", "deviceTypes", "settings", "devices", "places", "users"];
	// let targetCollectionList = [
	// 	"accounts",
	// 	"actuatings",
	// 	"boards",
	// 	"desired",
	// 	"deviceJobs",
	// 	"deviceTypes",
	// 	"devices",
	// 	"firmwareHistory",
	// 	"oauthClients",
	// 	"placeSharings",
	// 	// "references",
	// 	// "settings",
	// 	"jobs",
	// 	"thinqTokens",
	// 	"weatherForecast",
	// 	"withdrawUsers",
	// 	"users",
	// 	"thinq",
	// 	"weather",
	// 	"sensings",
	// 	"notifications",
	// 	"places",
	// ]; // TODO : 대상 collection을 추가

	let targetCollectionList = ["weather"];
	try {
		var Gauge = CLUI.Gauge;

		let items;
		let totalCount;
		for (const targetCollection of targetCollectionList) {
			console.debug(`========================================`);
			console.debug(`delete targetCollection : ${targetCollection}`);
			totalCount = await MONGO_DB.count(ENV.MONGO_DB.ID, targetCollection, {});
			console.debug(`totalCount : ${totalCount}`);

			for (let index = 0; index < totalCount; index++) {
				item = await MONGO_DB.findOne(ENV.MONGO_DB.ID, targetCollection, {});
				console.debug(Gauge(index, totalCount, 40, totalCount, index + "/" + totalCount));

				if (targetCollection === "thinqTokens") {
					await MONGO_DB.deleteObjectByUserId(ENV.MONGO_DB.ID, "thinqTokens", item.userId);
				} else {
					await MONGO_DB.del(ENV.MONGO_DB.ID, targetCollection, { _id: ObjectId(item._id) });
				}
				// await SLEEP(20);
			}
		}
	} catch (error) {
		console.debug(`error! : ${error}`);
	}
	console.debug(`Done!`);
}

async function deleteThinq() {}
