var MONGO_DB = require("./persistent/mongo");
var EVENT_HUB = require("./azure/eventhub");
var IOT_HUB = require("./azure/iothub");

var serverUptime = new Date();

const ENV = {
	IOT_HUB: {
		CONNECTION_STRING: "HostName=zinfwiothubdev.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=cmOEEnjZUvf5vi5Bb4yc6rRrx1jQotQDVOuPhkw17AQ=",
	},
};

const DEVICE = {
	DEVICE_ID: "5fa4d5c5bb69ff00199443e1",
	MESSAGE: {
		// operation: "firmwareUpdate",
		// device: {
		// 		modem: {
		// 			version: "0.9.7.7",
		// 			url: "",
		// 			fileName: "",
		// 			lastUpdated: "",
		// 			result: "",
		// 		},
		// 	},
		// },
	},
};

async function main() {
	await init();
	await requestDesired();
}

main().catch((err) => {
	console.log("Error occurred: ", err);
});

async function init() {
	console.log("init service!!!");
	IOT_HUB.init(ENV.IOT_HUB.CONNECTION_STRING);
}

async function requestDesired() {
	try {
		console.log(`requestChangeVentMode : vent deviceId(${DEVICE.VENT.DEVICE_ID}, message:(${message}))`);
		await IOT_HUB.requestDesired(DEVICE.DEVICE_ID, DEVICE.MESSAGE);
	} catch (error) {
		console.log(error.stack || error);
	}
}
