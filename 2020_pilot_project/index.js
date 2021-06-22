'use strict';

const chalk = require('chalk');
var Client = require('azure-iot-device').Client;
var Protocol = require('azure-iot-device-mqtt').Mqtt;
const express = require('express')
const app = express()
const port = 3000
// bodyParser를 사용하기 위해 추가한다.
const bodyParser = require('body-parser')
var MONGO_DB = require("./persistent/mongo");
var EVENT_HUB = require("./azure/eventhub");
var IOT_HUB = require("./azure/iothub");
var serverUptime = new Date();

var connectionString;
var client;
var reportedPropertiesPatch;


const ENV = {
	MONGO_DB: {
		ID: "dev",
		URI: "mongodb://iotzin-db-dev:nvmrJuYy28wn3pB2QTIhDq7EUbV9Jlv878jbS8XS7AnTMc9KhgTViAdGfN0gT06Q0bxzdlzMEq9jQXycXhXojQ==@iotzin-db-dev.documents.azure.com:10255/?ssl=true&replicaSet=globaldb",
		DB_NAME: "zinfwdbdev",
	},
	EVENT_HUB: {
		CONNECTION_STRING: "Endpoint=sb://iotzin-eventhub-dev.servicebus.windows.net/;SharedAccessKeyName=iothubroutes_zin-iot-hub-dev;SharedAccessKey=vDLnyI0SDxoRO+8qBSR4xrv3BDnSMG14wsaKlOg8Hmg=;EntityPath=eventhub_from_zinfw_iothub_twinchanged",
		EVENTHUB_NAME: "eventhub_from_zinfw_iothub_twinchanged",
		CONSUMER_GROUP: "$Default",
		STORAGE_CONNECTION_STRING: "DefaultEndpointsProtocol=https;AccountName=iotzinlogsdev;AccountKey=GfguIkJYc7F+NMcRsnzUAhVWMRB6rFjGBFwmEE4ILA55na9j3HAp+prmN40DqP4KTwc4pANRoclUImQ9UnBo8w==;EndpointSuffix=core.windows.net",
		CONTAINER_NAME: "devicetwin-for-test",
	},
	IOT_HUB: {
		CONNECTION_STRING: "HostName=zin-iot-hub-dev.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=hlQ3ey8TpqX7o4xipXFb9RtYFc9x0yKXXE63imwlSxM=",
	},
};



main().catch((err) => {
	console.log("Error occurred: ", err);
});



async function main() {
	await init();
	//await updateDeviceId();

	// start trigger of eventHub
	console.log("start trigger!!!");
	//EVENT_HUB.subscript(eventHubCallback);
}



async function init() {
	console.log("init service!!!");
	await MONGO_DB.init(ENV.MONGO_DB.ID, ENV.MONGO_DB.URI, ENV.MONGO_DB.DB_NAME);
	//IOT_HUB.init(ENV.IOT_HUB.CONNECTION_STRING);
	//EVENT_HUB.init(ENV.EVENT_HUB.CONNECTION_STRING, ENV.EVENT_HUB.EVENTHUB_NAME, ENV.EVENT_HUB.CONSUMER_GROUP, ENV.EVENT_HUB.STORAGE_CONNECTION_STRING, ENV.EVENT_HUB.CONTAINER_NAME);
}


async function getDeviceIdByMacAddress(mac,callback) {
	let device = await MONGO_DB.findOne(ENV.MONGO_DB.ID, "devices", { "device.macAddr": mac, "isActivate": true });
	if (device) {
		callback(device.device.deviceId);
	} else {
		return null;
	}


	
}



app.use(bodyParser.json());


app.post('/register', (req, res) => {
   var callname = req.body.name;
   console.log(callname);
   res.send(req.body);

})



app.post('/readDeviceId', (req, res) => {

    
   //let callname = req.body.name;
   //console.log(callname);
   res.send(req.body);
   let deviceID = getDeviceIdByMacAddress("500291f72dbb",function(res){
   console.log(res);

   }
   
   );
   


 })



 app.post('/readDeviceFan', (req, res) => {

    
	//let callname = req.body.name;
	//console.log(callname);
	res.send(req.body);
	let deviceID = getDeviceIdByMacAddress("500291f72dbb",function(res){
	console.log(res);
 
	}
	
	);
	
 
 
  })
 


app.post('/connectionIothub', (req, res) => {
    // <createhubclient>
    // Get the device connection string from a command line argument
    connectionString = req.body.connectInform;
    client = Client.fromConnectionString(connectionString, Protocol);
    // </createhubclient>
    console.log(connectionString);
    res.send(req.body);
 
 })


app.post('/reported', (req, res) => {
    reportedPropertiesPatch = req.body;
    console.log(reportedPropertiesPatch);
    res.send("send ok");


    client.getTwin(function(err, twin) {
        if (err) {
          console.error(chalk.red('Could not get device twin'));
        } else {
          console.log(chalk.green('Device twin created'));
         
          // <components>
          // Keep track of all the components the device knows about
          var componentList = {};
      
          sendReportedProperties();
      
          // <sendreportedproperties>
          // Send the reported properties patch to the hub
          function sendReportedProperties() {
            twin.properties.reported.update(reportedPropertiesPatch, function(err) {
              if (err) throw err;
              console.log(chalk.red('\nTwin state reported'));
              console.log(JSON.stringify(reportedPropertiesPatch, null, 2));
            });
          }
          // </sendreportedproperties>
        }
      });

 
 })


 app.post('/onlyReported', (req, res) => {
  reportedPropertiesPatch = req.body;
  console.log(reportedPropertiesPatch);
  res.send("send ok");

  var componentList = {};
    
  sendReportedProperties();

  // <sendreportedproperties>
  // Send the reported properties patch to the hub
  function sendReportedProperties() {
    twin.properties.reported.update(reportedPropertiesPatch, function(err) {
      if (err) throw err;
      console.log(chalk.red('\nTwin state reported'));
      console.log(JSON.stringify(reportedPropertiesPatch, null, 2));
    });
  }



})





app.post('/desired', (req, res) => {
      reportedPropertiesPatch = req.body;
      console.log(reportedPropertiesPatch);
      res.send("send ok");
  
  
      client.getTwin(function(err, twin) {
        if (err) {
          console.error(chalk.red('Could not get device twin'));
        } else {
          console.log(chalk.green('Device twin created'));
          
          // Handle changes to the fanOn desired property
          twin.on('properties.desired', function(delta) {
            console.log('new desired properties received:');
            console.log(JSON.stringify(delta));
        });
          // </sendreportedproperties>
        }
      });
  
   
})




 

//app.get('/', (req, res) => res.send('Develog!'))
app.listen(port, () => console.log(`Example app listening on port ${port}!`))













/*
const DEVICE = {
	SMARTHOOD: {
		MAC_ADDRESS: "500291d15e45",
		DEVICE_ID: "",
	},
	VENT: {
		MAC_ADDRESS: "d8bfc0e68784",
		DEVICE_ID: "",
		TARGET_MODE: "3",
	},
};

async function main() {
	await init();
	await updateDeviceId();

	// start trigger of eventHub
	console.log("start trigger!!!");
	EVENT_HUB.subscript(eventHubCallback);
}

main().catch((err) => {
	console.log("Error occurred: ", err);
});

async function init() {
	console.log("init service!!!");
	await MONGO_DB.init(ENV.MONGO_DB.ID, ENV.MONGO_DB.URI, ENV.MONGO_DB.DB_NAME);
	IOT_HUB.init(ENV.IOT_HUB.CONNECTION_STRING);
	EVENT_HUB.init(ENV.EVENT_HUB.CONNECTION_STRING, ENV.EVENT_HUB.EVENTHUB_NAME, ENV.EVENT_HUB.CONSUMER_GROUP, ENV.EVENT_HUB.STORAGE_CONNECTION_STRING, ENV.EVENT_HUB.CONTAINER_NAME);
}

// init eventhub callback
const eventHubCallback = async function (deviceId, event) {
	let message = event.body;

	try {
		// 서버 기동 이전에 들어온 메시지는 무시
		let lastupdatedDate = new Date(message.properties.reported.$metadata.$lastUpdated);
		if (serverUptime > lastupdatedDate.getTime()) {
			console.log(`ignore old Messages, deviceId(${deviceId})`);
			return;
		}
	} catch {
		// do nothing
	}

	// reported 이외의 이벤트는 무시
	if (!message.properties.reported) return;

	// 해당 디바이스들이 재동록되면 deviceId를 업데이트 함
	let isRegistered = await updateDeviceIdByRegistered(deviceId, message);
	if (isRegistered) return;

	// 센서 데이터가 없는 경우 무시
	if (!message.properties.reported.sensor) return;

	// 등록된 스마트후드의 센서 이벤트 처리
	if (deviceId === DEVICE.SMARTHOOD.DEVICE_ID) {
		let sensor = message.properties.reported.sensor;
		handleEventHubEvent(deviceId, sensor);
	}
};

async function updateDeviceIdByRegistered(deviceId, message) {
	let operation = message.properties.reported.operation;
	if (operation === "create") {
		let device = await MONGO_DB.findFromObjectId(ENV.MONGO_DB.ID, "devices", deviceId);
		if (!device || !device.device || !device.device.macAddr) {
			return;
		} else if (device.device.macAddr === DEVICE.SMARTHOOD.DEVICE_ID) {
			await updateDeviceId();
		} else if (device.device.macAddr === DEVICE.VENT.DEVICE_ID) {
			await updateDeviceId();
		}
	}
}

async function updateDeviceId() {
	console.log("update deviceId!!!");
	DEVICE.SMARTHOOD.DEVICE_ID = await getDeviceIdByMacAddress(DEVICE.SMARTHOOD.MAC_ADDRESS);
	DEVICE.VENT.DEVICE_ID = await getDeviceIdByMacAddress(DEVICE.VENT.MAC_ADDRESS);
	console.log(`- DEVICE.SMARTHOOD.DEVICE_ID : ${DEVICE.SMARTHOOD.DEVICE_ID}`);
	console.log(`- DEVICE.VENT.DEVICE_ID : ${DEVICE.VENT.DEVICE_ID}`);
}

async function getDeviceIdByMacAddress(mac) {
	let device = await MONGO_DB.findOne(ENV.MONGO_DB.ID, "devices", { "device.macAddr": mac, isActivate: true });
	if (device) {
		return device.device.deviceId;
	} else {
		return null;
	}
}

async function getDeviceByMacAddress(mac) {
	let device = await MONGO_DB.findOne(ENV.MONGO_DB.ID, "devices", { "device.macAddr": mac, isActivate: true });
	if (device) {
		return device;
	} else {
		return null;
	}
}

async function handleEventHubEvent(deviceId, sensor) {
	console.log(`handleEventHubEvent : smartHood deviceId(${deviceId}), sensor(${JSON.stringify(sensor)})`);
	if (checkFanOverSpeed(sensor)) {
		await requestChangeVentMode();
	}
}

function checkFanOverSpeed(sensor) {
	if (!sensor || !sensor.fan || !sensor.fan.fanSpeed) {
		return false;
	} else if (sensor.fan.fanSpeed && parseInt(sensor.fan.fanSpeed) >= 3) {
		return true;
	} else {
		return false;
	}
}

async function requestChangeVentMode() {
	try {
		let device = await getDeviceByMacAddress(DEVICE.VENT.MAC_ADDRESS);
		if (!device || !device.sensor || !device.sensor.mode) {
			console.log(`target device error : vent deviceId(${DEVICE.VENT.DEVICE_ID}, deviceOgj(${JSON.stringify(device)})`);
			return;
		}

		if (device.sensor.mode !== DEVICE.VENT.TARGET_MODE) {
			let message = { sensor: { mode: DEVICE.VENT.TARGET_MODE } };
			console.log(`requestChangeVentMode : vent deviceId(${DEVICE.VENT.DEVICE_ID}, message:(${JSON.stringify(message)}))`);
			await IOT_HUB.requestDesired(DEVICE.VENT.DEVICE_ID, message);
		} else {
			console.log(`already ventMode is ${DEVICE.VENT.TARGET_MODE} : vent deviceId(${DEVICE.VENT.DEVICE_ID}`);
		}
	} catch (error) {
		console.log(error.stack || error);
	}
}
*/