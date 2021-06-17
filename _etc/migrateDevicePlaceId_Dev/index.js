const SLEEP = require("await-sleep");
var CLUI = require("clui");
var MONGO_DB = require("./persistent/mongo");
var REDIS = require("./persistent/redis");
var GAUGE = CLUI.Gauge;

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
	await initMongoDb();
	await startMongoDbMigration();
}

async function initMongoDb() {
	MONGO_DB.setEnv(ENV.MONGO_DB.DEV.ID, ENV.MONGO_DB.DEV.URI, ENV.MONGO_DB.DEV.DB_NAME);
	await MONGO_DB.init(ENV.MONGO_DB.DEV.ID);

	// MONGO_DB.setEnv(ENV.MONGO_DB.PRD.ID, ENV.MONGO_DB.PRD.URI, ENV.MONGO_DB.PRD.DB_NAME);
	// await MONGO_DB.init(ENV.MONGO_DB.PRD.ID);
}

async function startMongoDbMigration() {
	console.debug(`========================================`);
	console.debug(`Start MongoDb`);

	try {
		let targetCollection = "devices";
		let items;
		let totalCount;

		totalCount = await MONGO_DB.count(ENV.MONGO_DB.DEV.ID, targetCollection, {});
		items = await MONGO_DB.find(ENV.MONGO_DB.DEV.ID, targetCollection, {});
		console.debug(`========================================`);
		count = 0;

		let collection = await MONGO_DB.getCollection(ENV.MONGO_DB.DEV.ID, targetCollection);

		for (const item of items) {
			count++;
			console.debug(GAUGE(count, totalCount, 40, totalCount, count + "/" + totalCount));
			try {
				console.debug(JSON.stringify(item, null, 2));
				item.placeObjectId = ObjectId(item.placeId);
				collection.updateOne({ _id: ObjectId(item._id) }, { $set: { placeObjectId: ObjectId(item.placeId) } }, { upsert: false });
				// await SLEEP(20);
			} catch (error) {
				console.debug(`error! : ${error}`);
			}
			// break;
		}
	} catch (error) {
		console.debug(`error! : ${error}`);
	}
	console.debug(`Done!`);
}
