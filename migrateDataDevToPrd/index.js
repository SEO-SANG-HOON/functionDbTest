var CLUI = require("clui");
var MONGO_DB = require("./persistent/mongo");
var GAUGE = CLUI.Gauge;

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

	MONGO_DB.setEnv(ENV.MONGO_DB.PRD.ID, ENV.MONGO_DB.PRD.URI, ENV.MONGO_DB.PRD.DB_NAME);
	await MONGO_DB.init(ENV.MONGO_DB.PRD.ID);
}

async function startMongoDbMigration() {
	console.debug(`========================================`);
	console.debug(`Start MongoDb`);

	let targetCollectionList = ["deviceTypes", "settings"]; // 개발에서 운영으로 이관할 대상 collection 목록
	try {
		let items;
		let totalCount;
		for (const targetCollection of targetCollectionList) {
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
					// 이관하면 안되는 속성 무시
					if (!isIgnoreAttr(item)) {
						await MONGO_DB.insert(ENV.MONGO_DB.PRD.ID, targetCollection, item);
					}
				} catch (error) {}
			}
		}
	} catch (error) {
		console.debug(`error! : ${error}`);
	}
	console.debug(`Done!`);
}

function isIgnoreAttr(item) {
	if (item.key && item.key === "dps") {
		return true;
	} else {
		return false;
	}
}
