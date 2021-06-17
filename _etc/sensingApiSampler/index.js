var MONGO_DB = require("./persistent/mongo");
const { ObjectId, ISODate } = require("mongodb");
var CLUI = require("clui");
var GAUGE = CLUI.Gauge;
const SLEEP = require("await-sleep");
var moment = require("moment");
require("moment-timezone");
moment.tz.setDefault("Asia/Seoul");

let TARGET_DATE = new Date();
let TARGET_USERID = "5f31f197e75b1d0018b02ef4"; // "5f070d507e532f0019e01ed3";
let TARGET_DEVICEID = "5f31ff1a4a7f870019f92256"; // "5f1ff60c627c670018acd943";
let ON_OFF_STATUS = "on";
let FROM;
let TO;

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
	FROM = new Date("2020-08-10T00:00:00.000Z");
	TO = addDay(FROM, 200);

	await initMongoDb();
	// await start();

	let result;
	let targetSensor;

	console.log(`============== ${targetSensor} ==============`);
	targetSensor = "sensor.leftFront.power.powerLevel";
	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO);
	console.log(`${JSON.stringify(result, null, 4)}`);
	targetSensor = "sensor.rightFront.power.powerLevel";
	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO);
	console.log(`${JSON.stringify(result, null, 4)}`);
	targetSensor = "sensor.leftRear.power.powerLevel";
	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO);
	console.log(`${JSON.stringify(result, null, 4)}`);

	// smartHoodUsageItem
	// targetSensor = "sensor.power.usageTime";
	// console.log(`============== ${targetSensor} ==============`);
	// result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO);
	// console.log(`${JSON.stringify(result)}`);
	// result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 15);
	// console.log(`${JSON.stringify(result)}`);
	// result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 30);
	// console.log(`${JSON.stringify(result)}`);
	// result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 60 * 2);
	// console.log(`${JSON.stringify(result)}`);
	// result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 60 * 24);
	// console.log(`${JSON.stringify(result)}`);

	// smartHoodUsageItem
	// targetSensor = "sensor.power.status";
	// console.log(`============== ${targetSensor} ==============`);
	// result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO);
	// console.log(`${JSON.stringify(result)}`);
	// result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 15);
	// console.log(`${JSON.stringify(result)}`);
	// result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 30);
	// console.log(`${JSON.stringify(result)}`);
	// result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 60 * 2);
	// console.log(`${JSON.stringify(result)}`);
	// result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 60 * 24);
	// console.log(`${JSON.stringify(result)}`);

	// // ventDustItem
	// 	targetSensor = "sensor.dust";
	// 	console.log(`============== ${targetSensor} ==============`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 15);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 30);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 60 * 2);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 60 * 24);
	// 	console.log(`${JSON.stringify(result)}`);

	// 	// // ventTemperateItem
	// 	targetSensor = "sensor.temperate";
	// 	console.log(`============== ${targetSensor} ==============`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 15);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 30);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 60 * 2);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 60 * 24);
	// 	console.log(`${JSON.stringify(result)}`);

	// 	// // smartLedDoorEventItem
	// 	targetSensor = "sensor.status";
	// 	console.log(`============== ${targetSensor} ==============`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 15);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 30);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 60 * 2);
	// 	console.log(`${JSON.stringify(result)}`);
	// 	result = await getSensorTrend(TARGET_DEVICEID, targetSensor, FROM, TO, 60 * 24);
	// 	console.log(`${JSON.stringify(result)}`);
	process.exit(1);
}

async function initMongoDb() {
	// MONGO_DB.setEnv(ENV.MONGO_DB.DEV.ID, ENV.MONGO_DB.DEV.URI, ENV.MONGO_DB.DEV.DB_NAME);
	// await MONGO_DB.init(ENV.MONGO_DB.DEV.ID);

	MONGO_DB.setEnv(ENV.MONGO_DB.PRD.ID, ENV.MONGO_DB.PRD.URI, ENV.MONGO_DB.PRD.DB_NAME);
	await MONGO_DB.init(ENV.MONGO_DB.PRD.ID);
}

async function getSensorTrend(targerDeviceId, targetSensor, from, to, interval) {
	let targetCollection = "sensings";
	let targetDatabase = ENV.MONGO_DB.PRD.ID;

	// query
	let query = { sensingAt: { $gte: from, $lte: to }, deviceId: ObjectId(targerDeviceId) };
	query[targetSensor] = { $exists: true };
	let project = { sensingAt: 1, targetSensor: 1, deviceId: 1, value: 1, userId: 1, _id: 0 };
	let trendData;
	if (!interval) {
		trendData = await aggregate(targetDatabase, targetCollection, targetSensor, query, project);
	} else {
		trendData = await aggregateInterval(targetDatabase, targetCollection, targetSensor, query, project, interval);
	}

	// convert
	let data = [];
	let sum = 0;
	let count = 0;
	for (const trend of trendData) {
		if (typeof trend.value !== "string") {
			if (!interval) {
				sum = sum + trend.value;
				count++;
			} else {
				sum = sum + trend.sum;
				count = count + trend.count;
			}
		} else {
			count++;
		}
		//data.push([new Date(trend.sensingAt).getTime(), trend.value]);

		data.push([moment(trend.sensingAt).format("YYYY-MM-DD HH:MM:SS"), trend.value]);
	}
	let resultData = {
		sum: sum,
		average: sum / count,
		count: count,
		data: data,
	};
	return resultData;
}

async function aggregate(id, collectionName, targetSensor, query, project) {
	try {
		let collection = await MONGO_DB.getCollection(id, collectionName);
		let cursor = await collection.aggregate([{ $match: query }, { $addFields: { value: "$" + targetSensor } }, { $project: project }]);
		//let cursor = await collection.aggregate([{ $match: query }, { $addFields: { value: "$" + targetSensor } }]);
		let result = await cursor.toArray();
		return result;
	} catch (error) {
		throw error;
	}
}

async function aggregateInterval(id, collectionName, targetSensor, query, project, interval) {
	try {
		let collection = await MONGO_DB.getCollection(id, collectionName);
		query[targetSensor] = { $exists: true };
		let average = { $avg: "$" + targetSensor };

		// make group
		let group;
		if (interval < 60) {
			group = {
				year: { $year: "$sensingAt" },
				month: { $month: "$sensingAt" },
				day: { $dayOfMonth: "$sensingAt" },
				hour: { $hour: "$sensingAt" },
				min: {
					$subtract: [{ $minute: "$sensingAt" }, { $mod: [{ $minute: "$sensingAt" }, interval] }],
				},
			};
		} else if (interval < 60 * 24) {
			group = {
				year: { $year: "$sensingAt" },
				month: { $month: "$sensingAt" },
				day: { $dayOfMonth: "$sensingAt" },
				hour: {
					$subtract: [{ $hour: "$sensingAt" }, { $mod: [{ $hour: "$sensingAt" }, interval / 60] }],
				},
			};
		} else {
			group = {
				year: { $year: "$sensingAt" },
				month: { $month: "$sensingAt" },
				day: { $dayOfMonth: "$sensingAt" },
			};
		}

		// query
		let cursor = await collection.aggregate([
			{ $match: query },
			{
				$group: {
					_id: group,
					count: { $sum: 1 },
					sum: { $sum: "$" + targetSensor },
					value: average,
				},
			},
		]);
		let result = await cursor.toArray();
		for (const item of result) {
			if (!item._id.hour) item._id.hour = 0;
			if (!item._id.min) item._id.min = 0;

			dateString = item._id.year + "-" + padWithZeroes(item._id.month, 2) + "-" + padWithZeroes(item._id.day, 2) + "T" + padWithZeroes(item._id.hour, 2) + ":" + padWithZeroes(item._id.min, 2) + ":00.000Z";
			item.sensingAt = new Date(dateString);
		}
		return result;
	} catch (error) {
		throw error;
	}
}

async function start() {
	console.debug(`========================================`);
	let targetCollection = "sensings";

	// db.getCollection('sensings').find({userId: "5f070d507e532f0019e01ed3"})

	TARGET_DATE = new Date("2020-08-01T00:00:00.000Z");

	try {
		let totalCount;
		let targetDatabase = ENV.MONGO_DB.PRD.ID;

		totalCount = 100;
		for (let count = 0; count < totalCount; count++) {
			let item = generateItem();
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

function generateItem() {
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

	//let item = smartHoodUsageItem();
	// let item = ventDustItem();
	// let item = ventTemperateItem();
	let item = smartLedDoorEventItem();
	return item;
}

function smartHoodUsageItem() {
	let time = getRandomInt(1, 60); // 최대 1시간 랜덤시간 추가
	let ussage = time - getRandomInt(0, time - 1);
	if (ussage < 1) ussage = 1;

	TARGET_DATE = addMinutes(TARGET_DATE, time);

	let item = {
		userId: TARGET_USERID,
		deviceId: ObjectId(TARGET_DEVICEID),
		deviceType: "DEVICE_TYPE",
		sensor: {
			usage: ussage,
		},
		sensingAt: TARGET_DATE,
	};

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

function addDay(date, day) {
	return new Date(date.getTime() + day * 60000 * 60 * 24);
}

// async function getSensorTrendSum(targetDatabaseId, targetCollection, targetSensor, TARGET_DEVICEID, from, to) {
// 	let query = { sensingAt: { $gte: from, $lte: to }, deviceId: ObjectId(TARGET_DEVICEID) };
// 	query[targetSensor] = { $exists: true };
// 	let project = { value: 1, sum: 1, count: 1, _id: 0 };
// 	let result = await aggregateSum(targetDatabaseId, targetCollection, targetSensor, query, project);
// 	return result[0];
// }

// async function aggregateSum(id, collectionName, targetSensor, query, project) {
// 	try {
// 		let collection = await MONGO_DB.getCollection(id, collectionName);
// 		let average = { $avg: "$" + targetSensor };
// 		let sum = { $sum: "$" + targetSensor };
// 		query[targetSensor] = { $exists: true };
// 		let cursor = await collection.aggregate([
// 			{ $match: query },
// 			{
// 				$group: {
// 					_id: {},
// 					value: average,
// 					sum: sum,
// 				},
// 			},
// 			{ $project: project },
// 		]);
// 		let result = await cursor.toArray();
// 		return result;
// 	} catch (error) {
// 		throw error;
// 	}
// }

function padWithZeroes(number, length) {
	var my_string = "" + number;
	while (my_string.length < length) {
		my_string = "0" + my_string;
	}
	return my_string;
}
