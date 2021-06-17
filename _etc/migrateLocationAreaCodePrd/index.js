var CLUI = require("clui");
var MONGO_DB = require("./persistent/mongo");
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
		// DEV: {
		// 	ID: "dev",
		// 	URI: process.env.DEV_MONGO_URI,
		// 	DB_NAME: process.env.DEV_DB_NAME,
		// },
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

	try {
		let items;
		let totalCount;

		let targetCollection = "places";
		totalCount = await MONGO_DB.count(ENV.MONGO_DB.PRD.ID, targetCollection, {});
		items = await MONGO_DB.find(ENV.MONGO_DB.PRD.ID, targetCollection, {});
		console.debug(`========================================`);
		console.debug(`insert targetCollection : ${targetCollection}`);
		count = 0;
		for (const item of items) {
			count++;
			console.debug(GAUGE(count, totalCount, 40, totalCount, count + "/" + totalCount));
			try {
				if (item.location.origin && !item.location.origin.areaCode) {
					console.debug(JSON.stringify(item, null, 2));
					let areaCode = await getAreaCode(item.location.origin);
					console.debug(`areaCode : ${areaCode}`);
					await MONGO_DB.update(ENV.MONGO_DB.PRD.ID, targetCollection, { _id: ObjectId(item._id.toString()) }, { $set: { "location.origin.areaCode": areaCode } });
				}
			} catch (error) {}
		}
	} catch (error) {
		console.debug(`error! : ${error}`);
	}
	console.debug(`Done!`);
}

async function getAreaCode(locationInfo) {
	try {
		let result = null;
		// 주소 1,2,3(h)단계 확인
		result = await MONGO_DB.findOne(ENV.MONGO_DB.PRD.ID, "weather", { region_1depth: locationInfo.region_1depth, region_2depth: locationInfo.region_2depth, region_3depth: locationInfo.region_3depth_h });
		if (result && result.areaCode) {
			return result.areaCode;
		}

		// 주소 1,2,3단계 확인
		result = await MONGO_DB.findOne(ENV.MONGO_DB.PRD.ID, "weather", { region_1depth: locationInfo.region_1depth, region_2depth: locationInfo.region_2depth, region_3depth: locationInfo.region_3depth });
		if (result && result.areaCode) {
			return result.areaCode;
		}

		// 주소 2,3(h)단계 확인
		result = await MONGO_DB.findOne(ENV.MONGO_DB.PRD.ID, "weather", { region_2depth: locationInfo.region_2depth, region_3depth: locationInfo.region_3depth_h });
		if (result && result.areaCode) {
			return result.areaCode;
		}

		// 주소 2,3단계 확인
		result = await MONGO_DB.findOne(ENV.MONGO_DB.PRD.ID, "weather", { region_2depth: locationInfo.region_2depth, region_3depth: locationInfo.region_3depth });
		if (result && result.areaCode) {
			return result.areaCode;
		}

		// 주소 1,2단계 확인
		result = await MONGO_DB.findOne(ENV.MONGO_DB.PRD.ID, "weather", { region_1depth: locationInfo.region_1depth, region_2depth: locationInfo.region_2depth });
		if (result && result.areaCode) {
			return result.areaCode;
		}

		// 주소 1단계 확인
		result = await MONGO_DB.findOne(ENV.MONGO_DB.PRD.ID, "weather", { region_1depth: locationInfo.region_1depth });
		if (result && result.areaCode) {
			return result.areaCode;
		}
	} catch (error) {
		// 아무것도 없으면 기본 코드로 설정
		return "10000";
	}
}
