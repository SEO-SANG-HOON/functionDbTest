const SLEEP = require("await-sleep");
var CLUI = require("clui");
var MONGO_DB = require("./persistent/mongo");
var REDIS = require("./persistent/redis");
var GAUGE = CLUI.Gauge;

const { ObjectId } = require("mongodb");
var ENV = {
	MONGO_DB: {
		DEV: {
			ID: "dev",
			URI: process.env.DEV_MONGO_URI,
			DB_NAME: process.env.DEV_DB_NAME,
		},
	},
};

main();

async function main() {
	await initMongoDb();
	await startMongoDbMigrationPrdToDev();

	process.exit(1);
}

async function initMongoDb() {
	MONGO_DB.setEnv(ENV.MONGO_DB.DEV.ID, ENV.MONGO_DB.DEV.URI, ENV.MONGO_DB.DEV.DB_NAME);
	await MONGO_DB.init(ENV.MONGO_DB.DEV.ID);
}

async function startMongoDbMigrationPrdToDev() {
	console.debug(`========================================`);
	console.debug(`Start MongoDb`);
	try {
		let items;
		let totalCount;
		const targetCollection = "sensings";

		// insert to target collection
		totalCount = await MONGO_DB.count(ENV.MONGO_DB.DEV.ID, targetCollection, { deviceId: ObjectId("5f4301c9b3b933001fe9b72c") });
		items = await MONGO_DB.find(ENV.MONGO_DB.DEV.ID, targetCollection, { deviceId: ObjectId("5f4301c9b3b933001fe9b72c") });
		console.debug(`========================================`);
		console.debug(`insert targetCollection : ${targetCollection}`);
		count = 0;
		for (const item of items) {
			count++;
			console.debug(GAUGE(count, totalCount, 40, totalCount, count + "/" + totalCount));
			item.sensingAtKor = new Date(new Date(item.sensingAt).getTime() + 60 * 60 * 9 * 1000);
			console.debug(JSON.stringify(item));
			try {
				await MONGO_DB.delFromObjectId(ENV.MONGO_DB.DEV.ID, targetCollection, item._id);
				await MONGO_DB.insert(ENV.MONGO_DB.DEV.ID, targetCollection, item);
				// await SLEEP(20);
			} catch (error) {}
		}
	} catch (error) {
		console.debug(`error! : ${error}`);
	}
	console.debug(`Done!`);
}
