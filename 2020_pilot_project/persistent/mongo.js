const { MongoClient, ObjectId } = require("mongodb");

var DB_LIST = {};

async function init(id, uri, dbName) {
	DB_LIST[id] = {
		uri: uri,
		dbName: dbName,
		client: null,
		db: null,
	};
	DB_LIST[id].client = await MongoClient.connect(DB_LIST[id].uri, { socketTimeoutMS: 10000, reconnectTries: 1 });
	DB_LIST[id].db = await DB_LIST[id].client.db(DB_LIST[id].dbName);
}

async function getCollection(id, collectionName) {
	try {
		let collection = DB_LIST[id].db.collection(collectionName);
		return collection;
	} catch (error) {
		throw error;
	}
}

async function insert(id, collectionName, data) {
	try {
		let collection = await getCollection(id, collectionName);
		let result = await collection.insertOne(data);
		return result;
	} catch (error) {
		throw error;
	}
}

async function find(id, collectionName, query, start, limit) {
	try {
		let collection = await getCollection(id, collectionName);
		let cursor;
		if (limit) {
			start = parseInt(start);
			limit = parseInt(limit);
			cursor = await collection.find(query).skip(start).limit(limit);
		} else {
			cursor = await collection.find(query);
		}
		let result = await cursor.toArray();
		return result;
	} catch (error) {
		throw error;
	}
}

async function count(id, collectionName, query) {
	try {
		let collection = await getCollection(id, collectionName);
		let result = await collection.countDocuments(query);
		return result;
	} catch (error) {
		throw error;
	}
}

async function findOne(id, collectionName, query) {
	try {
		let collection = await getCollection(id, collectionName);
		let result = await collection.findOne(query);
		return result;
	} catch (error) {
		throw error;
	}
}

async function del(id, collectionName, query) {
	try {
		let collection = await getCollection(id, collectionName);
		let cursor = await collection.deleteMany(query);
		return cursor;
	} catch (error) {
		throw error;
	}
}

async function deleteObjectByUserId(databaseId, collectionName, userId) {
	try {
		let collection = await getCollection(databaseId, collectionName);
		let query = { userId: userId };
		await collection.deleteOne(query);
	} catch (error) {
		throw error;
	}
}

async function update(id, collectionName, query, newData) {
	try {
		let collection = await getCollection(id, collectionName);
		return await collection.findOneAndUpdate(query, newData);
	} catch (error) {
		throw error;
	}
}

async function findFromObjectId(id, collectionName, objectId) {
	try {
		let collection = await getCollection(id, collectionName);
		let query = { _id: ObjectId(objectId) };
		let cursor = await collection.find(query);
		let result = await cursor.toArray();

		if (result.length == 1) {
			return result[0];
		} else {
			throw new Error(`ERROR 정의 필요`);
		}
	} catch (error) {
		throw error;
	}
}

async function delFromObjectId(id, collectionName, objectId) {
	try {
		let collection = await getCollection(id, collectionName);
		let query = { _id: ObjectId(objectId) };
		await collection.deleteOne(query);
	} catch (error) {
		throw error;
	}
}

module.exports = {
	init,
	find,
	count,
	findOne,
	insert,
	del,
	deleteObjectByUserId,
	update,
	findFromObjectId,
	delFromObjectId,
	getCollection,
};
