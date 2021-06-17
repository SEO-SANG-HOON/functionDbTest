var CLUI = require("clui");
var MONGO_DB = require("./persistent/mongo");
var GAUGE = CLUI.Gauge;

var ENV = {
	MONGO_DB: {
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
	MONGO_DB.setEnv(ENV.MONGO_DB.PRD.ID, ENV.MONGO_DB.PRD.URI, ENV.MONGO_DB.PRD.DB_NAME);
	await MONGO_DB.init(ENV.MONGO_DB.PRD.ID);
}

async function startMongoDbMigration() {
	console.debug(`========================================`);
	console.debug(`Start MongoDb`);

	let targetCollectionList = ["devices"];
	try {
		let items;
		let totalCount;
		for (const targetCollection of targetCollectionList) {
			// insert to target collection
			totalCount = await MONGO_DB.count(ENV.MONGO_DB.PRD.ID, targetCollection, {});
			items = await MONGO_DB.find(ENV.MONGO_DB.PRD.ID, targetCollection, {});
			console.debug(`========================================`);
			console.debug(`insert targetCollection : ${targetCollection}`);
			count = 0;
			for (const item of items) {
				count++;
				// console.debug(GAUGE(count, totalCount, 40, totalCount, count + "/" + totalCount));
				try {
					if (item.device.deviceId === "5f963591fbfcb2001817ce26") {
						// console.debug(JSON.stringify(item), null, 2);
						console.debug("0 : " + item.device.deviceId);
						console.debug("1 : " + item.createdAt);
						console.debug("2 : " + new Date(item.createdAt));
					}
				} catch (error) {}
			}
		}
	} catch (error) {
		console.debug(`error! : ${error}`);
	}
	console.debug(`Done!`);
}
