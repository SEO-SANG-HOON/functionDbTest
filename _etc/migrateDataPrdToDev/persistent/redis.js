const REDIS = require("redis");

const BLUEBIRD = require("bluebird");
BLUEBIRD.promisifyAll(REDIS.RedisClient.prototype);

var REDIS_CLIENT = null;

var REDIS_HOST = process.env.REDIS_HOST;
var REDIS_PORT = process.env.REDIS_PORT;
var REDIS_PASSWORD = process.env.REDIS_PASSWORD;
var REDIS_DB = "";

function setEnv(host, port, password, dbName) {
	REDIS_HOST = host;
	REDIS_PORT = port;
	REDIS_PASSWORD = password;
	REDIS_DB = dbName;
}

async function init() {
	if (!REDIS_CLIENT) {
		await createClient();
	}
}

async function createClient() {
	REDIS_CLIENT = await REDIS.createClient(REDIS_PORT, REDIS_HOST, {
		auth_pass: REDIS_PASSWORD,
		db: REDIS_DB,
		tls: { servername: REDIS_HOST },
	});
	REDIS_CLIENT.on("error", function (error) {
		client.on("connected", function () {
			createClient();
		});
	});
}

async function getClient() {
	try {
		if (!REDIS_CLIENT) {
			REDIS_CLIENT = await createClient();
		}
		return REDIS_CLIENT;
	} catch (error) {
		throw error;
	}
}

module.exports = {
	setEnv,
	init,
	getClient,
};
