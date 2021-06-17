const SLEEP = require("await-sleep");
const CLUI = require("clui");
const REDIS = require("./persistent/redis");
const MONGO_DB = require("./persistent/mongo");
const CONSTANTS = require("./constants");
const GAUGE = CLUI.Gauge;

const FS = require("fs");
const JSON_STREAM = require("JSONStream");
const STREAM = require("stream");
const PASS_THROUGH = new STREAM.PassThrough({
	objectMode: true,
});

const areaNameWideList = {
	강원도: "강원도",
	경기도: "경기도",
	경상남도: "경상남도",
	경상북도: "경상북도",
	세종특별자치시: "세종특별자치시",
	제주특별자치도: "제주특별자치도",
	전라남도: "전남",
	전라북도: "전북",
	충청남도: "충남",
	충청북도: "충북",
	광주광역시: "광주",
	대구광역시: "대구",
	대전광역시: "대전",
	부산광역시: "부산",
	서울특별시: "서울",
	울산광역시: "울산",
	인천광역시: "인천",
};

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

const TARGET_COLLECTION = "weather";

main();

async function main() {
	await initMongoDb();
	await start("./AIR_POLLUTION_20200830");
}

async function initMongoDb() {
	MONGO_DB.setEnv(ENV.MONGO_DB.DEV.ID, ENV.MONGO_DB.DEV.URI, ENV.MONGO_DB.DEV.DB_NAME);
	await MONGO_DB.init(ENV.MONGO_DB.DEV.ID);

	MONGO_DB.setEnv(ENV.MONGO_DB.PRD.ID, ENV.MONGO_DB.PRD.URI, ENV.MONGO_DB.PRD.DB_NAME);
	await MONGO_DB.init(ENV.MONGO_DB.PRD.ID);
}

// npm install --save ssh2-sftp-client
// https://www.npmjs.com/package/ssh2-sftp-client
// https://github.com/theophilusx/ssh2-sftp-client

// npm install --save JSONStream
// npm install --save event-stream
async function start(fileNameSeed) {
	// init
	let fileName = fileNameSeed + CONSTANTS.SFTP.FILE_EXT;

	// parse json
	let count = 0;
	const es = require("event-stream");
	var stream = FS.createReadStream(fileName, { encoding: "utf8" });
	stream.pipe(JSON_STREAM.parse("*")).pipe(
		es.through(async function (data) {
			this.pause();
			await handleJson(this, data);
		})
	);
}

var count = 0;
async function handleJson(es, data) {
	count++;
	console.debug(GAUGE(count, 3775, 40, count, count + "/" + 3775));
	let area = {
		type: "areaCodeList",
		areaCode: data.areaCode,
		region_1depth: convertAreaNameWide(data.areaNameWide),
		region_2depth: data.areaNameCity,
		region_3depth: data.areaNameDong,
		lat: data.LAT,
		lon: data.LON,
		datetime: new Date(),
	};
	console.log(JSON.stringify(area)); // whatever you will do with each JSON object
	try {
		await MONGO_DB.insert(ENV.MONGO_DB.DEV.ID, TARGET_COLLECTION, area);
		// await MONGO_DB.insert(ENV.MONGO_DB.PRD.ID, TARGET_COLLECTION, area);
		//await SLEEP(10);
		es.resume();
	} catch (error) {
		console.log(error);
	}
}

function convertAreaNameWide(areaNameWide) {
	if (areaNameWideList[areaNameWide]) {
		// console.log("from : " + areaNameWide + ", to : " + areaNameWideList[areaNameWide]);
		return areaNameWideList[areaNameWide];
	} else {
		areaNameWide;
	}
}
