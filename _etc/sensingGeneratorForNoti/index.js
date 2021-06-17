var MONGO_DB = require("./persistent/mongo");
const { ObjectId, ISODate } = require("mongodb");
var CLUI = require("clui");
var GAUGE = CLUI.Gauge;
const SLEEP = require("await-sleep");

let TARGET_DATE = new Date();
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

	startTargetDate = new Date("2020-09-04T00:00:00.000Z");
	ITEM_COUNT = 100;
	// TARGET_USERID = "5f50902eb03ed30018873a02"; // 지영승 책임
	// TARGET_DEVICEID = "5f509e0cb1b9c10018c45300"; // 전기레인지
	// TARGET_USERID = "5f43418dfc79a400189baf48"; // 손정환 책임
	// TARGET_DEVICEID = "5f2ce7c97e8da3001a403f27"; // 스마트후드
	TARGET_USERID = "5f43418dfc79a400189baf48"; // 민도준 선임
	TARGET_DEVICEID = "5f4ddda5403b65001839cacb"; // LED 핸들

	try {
		let totalCount;
		let targetDatabase = ENV.MONGO_DB.DEV.ID;
		let categoryList = ["전원", "제어", "센서"];
		totalCount = ITEM_COUNT;
		TARGET_DATE = startTargetDate;
		for (let count = 0; count < totalCount; count++) {
			let item = {
				sentAt: new Date(),
				type: "notification",
				category: categoryList[getRandomInt(0, 2)],
				userId: TARGET_USERID,
				deviceId: TARGET_DEVICEID,
				payload: {
					notification: {
						title: "ZIN Home",
						body: "[테스트] LED 핸들의 이벤트가 발생했습니다.",
					},
					data: {
						notification_foreground: "true",
						notification_body: "[테스트] LED 핸들의 이벤트가 발생했습니다.",
						notification_title: "ZIN Home",
						notification_android_channel_id: "ZIN_CHANNEL",
						notification_android_priority: "2",
						notification_android_visibility: "1",
						notification_ios_badge: "1",
						notification_msg: "ZinHome://CATEGORY_1/" + TARGET_DEVICEID,
					},
				},
				isSent: true,
				isShow: true,
			};
			console.debug(GAUGE(count, totalCount, 40, totalCount, count + "/" + totalCount));
			try {
				console.log(JSON.stringify(item));
				await MONGO_DB.insert(targetDatabase, targetCollection, item);
				// await SLEEP(20);
			} catch (error) {
				console.debug(JSON.stringify(error));
			}
		}
	} catch (error) {
		console.debug(`error! : ${error}`);
	}
	console.debug(`Done!`);
}

function generateItem(key) {
	let item;
	switch (key) {
		case "smartHoodUsageItem":
			item = smartHoodUsageItem();
			break;
		case "smartHoodOnOffItem":
			item = smartHoodOnOffItem();
			break;
		case "ventDustItem":
			item = ventDustItem();
			break;
		case "ventTemperateItem":
			item = ventTemperateItem();
			break;
		case "smartLedDoorEventItem":
			item = smartLedDoorEventItem();
			break;

		default:
			item = null;
			break;
	}
	return item;
}

function smartHoodUsageItem() {
	let time = getRandomInt(1, 60); // 최대 1시간 랜덤시간 추가
	let usage = time - getRandomInt(0, time - 1);
	if (usage < 1) usage = 1;

	TARGET_DATE = addMinutes(TARGET_DATE, time);

	let item = {
		userId: TARGET_USERID,
		deviceId: ObjectId(TARGET_DEVICEID),
		deviceType: "DEVICE_TYPE",
		sensor: {
			power: {
				usageTime: usage,
			},
		},
		sensingAt: TARGET_DATE,
	};

	return item;
}

function smartHoodOnOffItem() {
	TARGET_DATE = addMinutes(TARGET_DATE, getRandomInt(1, 60)); // 최대 1시간 랜덤시간 추가

	let item = {
		userId: TARGET_USERID,
		deviceId: ObjectId(TARGET_DEVICEID),
		deviceType: "DEVICE_TYPE",
		sensor: {
			power: {
				status: ON_OFF_STATUS,
			},
		},
		sensingAt: TARGET_DATE,
	};
	changeOnOff();
	return item;
}

function ventDustItem() {
	TARGET_DATE = addMinutes(TARGET_DATE, 10); // 10분마다

	let item = {
		userId: TARGET_USERID,
		deviceId: ObjectId(TARGET_DEVICEID),
		deviceType: "DEVICE_TYPE",
		sensor: {
			dust: getRandomInt(200, 600),
		},
		sensingAt: TARGET_DATE,
	};
	return item;
}

function ventTemperateItem() {
	TARGET_DATE = addMinutes(TARGET_DATE, 10); // 10분마다

	let item = {
		userId: TARGET_USERID,
		deviceId: ObjectId(TARGET_DEVICEID),
		deviceType: "DEVICE_TYPE",
		sensor: {
			temperate: getRandomInt(24, 28),
		},
		sensingAt: TARGET_DATE,
	};
	return item;
}

function smartLedDoorEventItem() {
	TARGET_DATE = addMinutes(TARGET_DATE, getRandomInt(1, 60)); // 최대 1시간 랜덤시간 추가

	let item = {
		userId: TARGET_USERID,
		deviceId: ObjectId(TARGET_DEVICEID),
		deviceType: "DEVICE_TYPE",
		sensor: {
			status: ON_OFF_STATUS,
		},
		sensingAt: TARGET_DATE,
	};

	changeOnOff();
	return item;
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
