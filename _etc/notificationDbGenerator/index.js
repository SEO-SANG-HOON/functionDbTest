var MONGO_DB = require("./persistent/mongo");
const { ObjectId, ISODate } = require("mongodb");
var CLUI = require("clui");
var GAUGE = CLUI.Gauge;
const SLEEP = require("await-sleep");

let TARGET_USERID = "";
let TARGET_DEVICEID = "";
let ON_OFF_STATUS = "on";
let ITEM_COUNT = 0;

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
	// await clearTargetData();
	await start();
	process.exit(1);
}

async function initMongoDb() {
	MONGO_DB.setEnv(ENV.MONGO_DB.DEV.ID, ENV.MONGO_DB.DEV.URI, ENV.MONGO_DB.DEV.DB_NAME);
	await MONGO_DB.init(ENV.MONGO_DB.DEV.ID);

	// MONGO_DB.setEnv(ENV.MONGO_DB.PRD.ID, ENV.MONGO_DB.PRD.URI, ENV.MONGO_DB.PRD.DB_NAME);
	// await MONGO_DB.init(ENV.MONGO_DB.PRD.ID);
}

async function start() {
	console.debug(`========================================`);
	let targetCollection = "notifications";

	startTargetDate = new Date("2020-01-09T00:00:00.000Z");
	ITEM_COUNT = 100;
	TARGET_USERID = "5f43418dfc79a400189baf48";
	TARGET_DEVICEID = "5f5092c6b03ed30018873a08";

	try {
		let totalCount;
		let targetDatabase = ENV.MONGO_DB.DEV.ID;
		let categoryList = ["전원", "제어", "센서"];
		totalCount = ITEM_COUNT;
		TARGET_DATE = startTargetDate;
		for (let count = 0; count < totalCount; count++) {
			let category = categoryList[getRandomInt(0, 2)];
			let item = {
				sentAt: new Date(),
				type: "notification",
				category: category,
				userId: TARGET_USERID,
				deviceId: TARGET_DEVICEID,
				payload: {
					notification: {
						title: "LG지인 링크",
						body: `Notification 테스트 - ${category}`,
					},
					data: {
						notification_body: `Notification 테스트 - ${category}`,
						notification_title: "LG지인 링크",
						notification_android_channel_id: "ZIN_CHANNEL",
						notification_android_priority: "2",
						notification_android_visibility: "1",
						notification_ios_badge: "1",
						notification_msg: "ZinHome://CATEGORY_3/" + TARGET_DEVICEID,
					},
					category: "제어",
				},
				isSent: false,
				isShow: true,
			};
			try {
				await MONGO_DB.insert(targetDatabase, targetCollection, item);
				console.debug(GAUGE(count, totalCount, 40, totalCount, count + "/" + totalCount));
				console.debug(JSON.stringify(item, null, 2));
			} catch (error) {
				console.debug(JSON.stringify(error));
			}
		}
	} catch (error) {
		console.debug(`error! : ${error}`);
	}
	console.debug(`Done!`);
}

function changeOnOff() {
	if (ON_OFF_STATUS === "on") {
		ON_OFF_STATUS = "off";
	} else {
		ON_OFF_STATUS = "on";
	}
}

function getRandomOnOff() {
	let value = getRandomInt(0, 1);
	if (value) {
		return "on";
	} else {
		return "off";
	}
}

function getRandomInt(min, max) {
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

function addMinutes(date, minutes) {
	return new Date(date.getTime() + minutes * 60000);
}
