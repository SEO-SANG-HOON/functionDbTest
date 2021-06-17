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

async function clearTargetData() {
	let targetDatabase = ENV.MONGO_DB.DEV.ID;
	let targetCollection = "sensings";
	TARGET_USERID = "5f43418dfc79a400189baf48"; // 개발계정
	// TARGET_DEVICEID = "5f600d7d3ae91f00186b628f"; // LED 핸들
	TARGET_DEVICEID = "5f5b040610e24a484861401d"; // 환기창

	let data = await MONGO_DB.find(targetDatabase, targetCollection, { deviceId: ObjectId(TARGET_DEVICEID) });
	let count = 0;
	for (const item of data) {
		count++;
		await MONGO_DB.delFromObjectId(targetDatabase, targetCollection, item._id);
		console.debug(GAUGE(count, data.length, 40, data.length, count + "/" + data.length));
	}
}

async function start() {
	console.debug(`========================================`);
	// db.getCollection('sensings').find({userId: "5f43418dfc79a400189baf48", deviceId: ObjectId("5f51df12a0db240018191cda")})

	startTargetDate = new Date("2020-09-10T00:00:00.000Z");
	ITEM_COUNT = 2500;
	TARGET_USERID = "5f43418dfc79a400189baf48"; // 개발계정
	//TARGET_DEVICEID = "5f600d7d3ae91f00186b628f"; // LED 핸들
	TARGET_DEVICEID = "5f5b040610e24a484861401d"; // 환기창 // smartVentilSensor

	try {
		//let itemKeyList = ["smartHoodOnOffItem", "smartHoodUsageItem", "ventDustItem", "ventTemperateItem", "smartLedDoorEventItem"];
		//let itemKeyList = ["smartLedDoorSensor", "smartLedDoorEventItem"];
		let itemKeyList = ["smartVentilSensor"];
		for (const itemKey of itemKeyList) {
			let totalCount;
			totalCount = ITEM_COUNT;
			TARGET_DATE = startTargetDate;
			for (let count = 0; count < totalCount; count++) {
				let item = generateItem(itemKey);
				console.debug(GAUGE(count, totalCount, 40, totalCount, count + "/" + totalCount));
				try {
					console.log(JSON.stringify(item));
					await MONGO_DB.insert(ENV.MONGO_DB.DEV.ID, "sensings", item);
					// await SLEEP(20);
				} catch (error) {
					console.debug(JSON.stringify(error));
				}
			}
		}
	} catch (error) {
		console.debug(`error! : ${error}`);
	}
	console.debug(`Done!`);
}

function generateItem(key) {
	/*
	시나리오
		- 스마트후드 사용량 (하루에 얼마 사용했는지), 일별 통계, 총 사용시간 합계, 주간(1주일간) 사용량(지난주 대비 얼마 더 사용했는지)
			- 스마트후드 사용량 : smartHoodUsageItem();
		- 자동환기시스템 센서별 추이
			- 초미세먼지 : ventDustItem();
				- 평균 : 일 평균농도 600ppm, 전일대비 +60ppm
				- 트랜드 정보 : 단위 시간별 이벤트 + 평균을 선으로 표현함
			- 온도 : ventTemperateItem();
				- 평균 : 일 평균농도 25도, 전일대비 +1ppm
				- 트랜드 정보 : 단위 시간별 이벤트 + 평균을 선으로 표현함
		- 스마트led
			- 개폐 이력 : on/off
	*/

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
		case "smartLedDoorSensor":
			item = smartLedDoorSensor();
			break;
		case "smartVentilSensor":
			item = smartVentilSensor();
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
		sensingAtKor: TARGET_DATE,
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
		sensingAtKor: TARGET_DATE,
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
		sensingAtKor: TARGET_DATE,
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
		sensingAtKor: TARGET_DATE,
	};
	return item;
}

function smartLedDoorSensor() {
	TARGET_DATE = addMinutes(TARGET_DATE, getRandomInt(1, 30)); // 최대 20분 랜덤시간 추가

	let item = {
		userId: TARGET_USERID,
		deviceId: ObjectId(TARGET_DEVICEID),
		deviceType: "LGH_LEDHANDLE2020A",
		sensor: {
			airCondition: {
				temperature: getRandomInt(24, 28),
				humidity: getRandomInt(20, 70),
				tvocs: getRandomInt(0, 1000) / 1000,
			},
		},
		sensingAt: TARGET_DATE,
		sensingAtKor: TARGET_DATE,
	};
	return item;
}

function smartLedDoorEventItem() {
	TARGET_DATE = addMinutes(TARGET_DATE, getRandomInt(1, 60)); // 최대 1시간 랜덤시간 추가

	let item = {
		userId: TARGET_USERID,
		deviceId: ObjectId(TARGET_DEVICEID),
		deviceType: "LGH_LEDHANDLE2020A",
		sensor: {
			doorStatus: ON_OFF_STATUS,
		},
		sensingAt: TARGET_DATE,
		sensingAtKor: TARGET_DATE,
	};

	changeOnOff();
	return item;
}

function smartVentilSensor() {
	TARGET_DATE = addMinutes(TARGET_DATE, getRandomInt(1, 30)); // 최대 20분 랜덤시간 추가

	let item = {
		userId: TARGET_USERID,
		deviceId: ObjectId(TARGET_DEVICEID),
		deviceType: "LGH_SMARTVENTIL2020A",
		sensor: {
			airCondition: {
				co2: getRandomInt(100, 300),
				pm2_5: getRandomInt(5, 50),
				tvocs: getRandomInt(0, 1000) / 1000,
				temperature: getRandomInt(24, 28),
				humidity: getRandomInt(20, 70),
			},
		},
		sensingAt: TARGET_DATE,
		sensingAtKor: TARGET_DATE,
	};
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
