var _ = require("lodash");
var HashMap = require("hashmap");

function jsonToMap(jsonObject) {
	try {
		var map = new HashMap();
		if (jsonObject) {
			iteratorJson(jsonObject, map);
		}
		return map;
	} catch (error) {
		return null;
	}
}

function mapToJson(map) {
	try {
		let result = {};
		if (map) {
			map.forEach(function (value, key) {
				setDescendantProp(result, key, value);
			});
		}
		return result;
	} catch (error) {
		return null;
	}
}

function jsonMerge(orgJson, newJson) {
	try {
		var newObj = jsonToMap(removeObjectsWithNull(newJson));

		let result = jsonCopy(orgJson);
		newObj.forEach(function (value, key) {
			setDescendantProp(result, key, value);
		});
		return result;
	} catch (error) {
		return null;
	}
}

function iteratorJson(jsonObject, map, parentKey, isArray) {
	try {
		if (!isArray) {
			isArray = false;
		}

		if (parentKey) {
			parentKey = parentKey + ".";
		} else {
			parentKey = "";
		}

		Object.keys(jsonObject).forEach((key) => {
			if (Array.isArray(jsonObject[key])) {
				iteratorJson(jsonObject[key], map, parentKey + key, true);
			} else if (typeof jsonObject[key] === "object") {
				iteratorJson(jsonObject[key], map, parentKey + key);
			} else {
				map.set(parentKey + key, jsonObject[key]);
			}
		});
	} catch (error) {
		return null;
	}
}

function get(jsonObject, param) {
	return getDescendantProp(jsonObject, param);
}

function set(jsonObject, param, value) {
	setDescendantProp(jsonObject, param, value);
}

function getDescendantProp(jsonObject, param) {
	return _.get(jsonObject, param);
}

function setDescendantProp(jsonObject, param, value) {
	return _.set(jsonObject, param, value);
}

function jsonCopy(json) {
	return JSON.parse(JSON.stringify(json));
}

function removeObjectsWithNull(obj) {
	return _(obj).pickBy(_.isObject).mapValues(removeObjectsWithNull).assign(_.omitBy(obj, _.isObject)).omitBy(_.isNil).value();
}

function isBlank(value) {
	return (_.isEmpty(value) && !_.isNumber(value) && !_.isBoolean(value)) || _.isNaN(value);
}

function removeObjectsWithEmpty(obj) {
	for (var attrKey in obj) {
		var attrValue = obj[attrKey];
		if (isBlank(attrValue)) {
			delete obj[attrKey];
		} else if (Object.prototype.toString.call(attrValue) === "[object Object]") {
			removeObjectsWithEmpty(attrValue);
		} else if (Array.isArray(attrValue)) {
			attrValue.forEach(function (arrayValue) {
				removeObjectsWithEmpty(arrayValue);
			});
		}
	}
}

function convJsonToDbData(obj) {
	try {
		let dbData = {};
		jsonToMap(obj).forEach(function (value, key) {
			dbData[key.replace(".", "_")] = value;
		});
		return dbData;
	} catch (error) {
		return null;
	}
}

function convDbDataToJson(obj) {
	try {
		let dataMap = new HashMap();
		for (key in obj) {
			let newKey;
			if (key === "_id") {
				newKey = key;
			} else {
				newKey = key.replace("_", ".");
			}
			let value = obj[key];
			dataMap.set(newKey, value);
		}
		return mapToJson(dataMap);
	} catch (error) {
		return null;
	}
}

function isJson(str) {
	try {
		JSON.parse(str);
	} catch (e) {
		return false;
	}
	return true;
}

module.exports = {
	get,
	set,
	jsonToMap,
	mapToJson,
	jsonMerge,
	jsonCopy,
	removeObjectsWithNull,
	removeObjectsWithEmpty,
	convJsonToDbData,
	convDbDataToJson,
	isJson,
	isBlank,
};
