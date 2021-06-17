const { Registry } = require("azure-iothub");
var connectionString = "";

function init(_connectionString) {
	connectionString = connectionString;
}

requestDesired = async (deviceId, desiredProperties, tags) => {
	return new Promise(async (resolve, reject) => {
		try {
			const registry = Registry.fromConnectionString(connectionString);

			registry.getTwin(deviceId, async (error, twin) => {
				if (error) {
					// console.log(error);
					reject(error);
				}
				try {
					await sendtoHub(twin, desiredProperties, tags);
					resolve(1);
				} catch (error) {
					// console.log(error);
					reject(error);
				}
			});
		} catch (error) {
			// console.log(`TWIN ERROR${JSON.stringify(error)}`);
			// console.log(error.stack || error);
			reject(error);
		}
	});
};

async function sendtoHub(twin, patchDesired, patchTags) {
	return new Promise(async (resolve, reject) => {
		const twinPatch = {};

		if (patchTags) {
			twinPatch.tags = patchTags;
		}

		if (patchDesired) {
			const properties = {};
			properties.desired = patchDesired;
			twinPatch.properties = properties;
		}

		twin.update(twinPatch, (error, twin) => {
			if (error) {
				// console.log("SEND ERROR");
				// console.log(error.stack || error);
				reject(error);
			} else {
				// console.log(`Sent ${JSON.stringify(patchDesired)}`);
				// console.log(JSON.stringify(patchTags, null, 2));
				resolve(1);
			}
		});
	});
}

module.exports = {
	init,
	requestDesired,
};
