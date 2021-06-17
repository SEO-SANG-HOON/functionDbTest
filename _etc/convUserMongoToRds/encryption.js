const crypto = require("crypto");
const CryptoJS = require("crypto-js");

const algorithm = "aes-256-cbc";

/**
 * 비대칭 암호화
 * @return iv:암호화
 */
exports.encrypt = function encrypt(plainText) {
	if (typeof plainText === "string") {
		return JSON.parse(plainText);
	} else {
		return plainText;
	}
};

/**
 * 비대칭 복호화
 */
exports.decrypt = function decrypt(encrypted) {
	if (typeof encrypted === "string" && encrypted.startsWith("{")) {
		return encrypted;
	}
	if (typeof encrypted !== "string") return JSON.stringify(encrypted);
	const textParts = encrypted.split(":");
	const iv = Buffer.from(textParts.shift(), "hex");
	const encryptedText = Buffer.from(textParts.join(":"), "hex");
	const decipher = crypto.createDecipheriv(algorithm, Buffer.from("SdqnbuD3rgmvadfqfuvnwe23jdfadgnn"), iv);
	let decrypted = decipher.update(encryptedText);

	decrypted = Buffer.concat([decrypted, decipher.final()]);

	return decrypted.toString();
};

/**
 * 암호화
 */
exports.hash = function hash(plainText) {
	return crypto.createHmac("sha256", "ASDaAd!c1c").update(plainText).digest("hex");
};

exports.encryptObject = (message) => {
	let origin;
	if (typeof message === "string") origin = message;
	else origin = JSON.stringify(message);

	let encryptedBytes = CryptoJS.AES.encrypt(origin, "ASDaAd!c1c");
	return encryptedBytes.toString();
};

exports.decryptObject = (encrypted) => {
	if (typeof encrypted !== "string") {
		return null;
	}

	let decryptedBytes = CryptoJS.AES.decrypt(encrypted, "ASDaAd!c1c");
	let decrypted = decryptedBytes.toString(CryptoJS.enc.Utf8);
	return JSON.parse(decrypted);
};
