// const SLEEP = require("await-sleep");
var CLUI = require("clui");
var MONGO_DB = require("./persistent/mongo");
const { ObjectId } = require("mongodb");

var ENV = {
	MONGO_DB: {
		// URI: process.env.DEV_MONGO_URI, // process.env.PRD_MONGO_URI,
		// DB_NAME: process.env.DEV_DB_NAME, // process.env.PRD_DB_NAME,
		URI: process.env.PRD_MONGO_URI, // process.env.PRD_MONGO_URI,
		DB_NAME: process.env.PRD_DB_NAME, // process.env.PRD_DB_NAME,
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
	let targetCollectionList = ["desired"]; // TODO : 대상 collection을 추가

	try {
		var Gauge = CLUI.Gauge;
		let totalCount;
		for (const targetCollection of targetCollectionList) {
			totalCount = await MONGO_DB.count(ENV.MONGO_DB.ID, targetCollection, {});
			items = await MONGO_DB.find(ENV.MONGO_DB.ID, targetCollection, {});
			console.debug(`========================================`);
			console.debug(`delete targetCollection : ${targetCollection}`);
			console.debug(`totalCount : ${totalCount}`);
			count = 0;
			for (const item of items) {
				count++;
				console.debug(Gauge(count, totalCount, 40, totalCount, count + "/" + totalCount));

				if (targetCollection === "thinqTokens") {
					await MONGO_DB.deleteObjectByUserId(ENV.MONGO_DB.ID, "thinqTokens", item.userId);
				} else {
					// 이관하면 안되는 속성 무시
					if (!isIgnoreAttr(item)) {
						await MONGO_DB.del(ENV.MONGO_DB.ID, targetCollection, { _id: ObjectId(item._id) });
					}
				}
				// await SLEEP(20);
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
