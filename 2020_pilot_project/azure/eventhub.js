// https://docs.microsoft.com/ko-kr/azure/event-hubs/event-hubs-node-get-started-send

const { EventHubConsumerClient } = require("@azure/event-hubs");
const { ContainerClient } = require("@azure/storage-blob");
const { BlobCheckpointStore } = require("@azure/eventhubs-checkpointstore-blob");

let connectionString;
let eventHubName;
let consumerGroup;
let storageConnectionString;
let containerName;

// member
var subscription;
var consumerClient;

function init(_connectionString, _eventHubName, _consumerGroup, _storageConnectionString, _containerName) {
	connectionString = _connectionString;
	eventHubName = _eventHubName;
	consumerGroup = _consumerGroup;
	storageConnectionString = _storageConnectionString;
	containerName = _containerName;
}

function subscript(callback) {
	// Create a blob container client and a blob checkpoint store using the client.
	const containerClient = new ContainerClient(storageConnectionString, containerName);
	const checkpointStore = new BlobCheckpointStore(containerClient);
	consumerClient = new EventHubConsumerClient(consumerGroup, connectionString, eventHubName, checkpointStore);

	// Subscribe to the events, and specify handlers for processing the events and errors.
	subscription = consumerClient.subscribe({
		processEvents: async (events, context) => {
			for (const event of events) {
				let deviceId = event.systemProperties["iothub-connection-device-id"];
				callback(deviceId, event);
			}
			// Update the checkpoint.
			await context.updateCheckpoint(events[events.length - 1]);
		},

		processError: async (err, context) => {
			console.log(`Error : ${err}`);
		},
	});
}

async function close() {
	await subscription.close();
	await consumerClient.close();
}

module.exports = {
	init,
	subscript,
	close,
};
