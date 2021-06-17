var MONGO_DB = require("./persistent/mongo");

var ENV = {
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
	ITEM_COUNT = 100;
	await initMongoDb();
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
	let targetUserId = "5f3b749c77a65c0019f169e5";
	// let targetDatabase = ENV.MONGO_DB.PRD.ID;
	let targetDatabase = ENV.MONGO_DB.DEV.ID;

	try {
		await MONGO_DB.deleteUser(targetDatabase, targetUserId);
	} catch (error) {
		console.log(error);
	}
}
