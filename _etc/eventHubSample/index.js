const { EventHubConsumerClient } = require("@azure/event-hubs");
const { ContainerClient } = require("@azure/storage-blob");
const { BlobCheckpointStore } = require("@azure/eventhubs-checkpointstore-blob");

const connectionString = "Endpoint=sb://zinfw-eventhub-dev.servicebus.windows.net/;SharedAccessKeyName=iothubroutes_zinfwiothubdev;SharedAccessKey=AvvTNsiiC8aSP11cxK/CyNX8x+E402FPBgZaOPKyl/k=;EntityPath=eventhub_from_zinfw_iothub_twinchanged_for_test";
const eventHubName = "eventhub_from_zinfw_iothub_twinchanged_for_test";
const consumerGroup = "$Default"; // name of the default consumer group
const storageConnectionString = "DefaultEndpointsProtocol=https;AccountName=zinfwlogsdev;AccountKey=RxxwnhG+wpDD7/lfVebJyIjp3o3FoD51TobFv4IGBAXT5hB9pFsg3duBhoB2tTAsmDOr4D/7KqQNhGl5A5RGeg==;EndpointSuffix=core.windows.net";
const containerName = "devicetwin-for-test";

// https://docs.microsoft.com/ko-kr/azure/event-hubs/event-hubs-node-get-started-send
async function main() {
	// Create a blob container client and a blob checkpoint store using the client.
	const containerClient = new ContainerClient(storageConnectionString, containerName);
	const checkpointStore = new BlobCheckpointStore(containerClient);

	// Create a consumer client for the event hub by specifying the checkpoint store.
	const consumerClient = new EventHubConsumerClient(consumerGroup, connectionString, eventHubName, checkpointStore);

	// Subscribe to the events, and specify handlers for processing the events and errors.
	const subscription = consumerClient.subscribe({
		processEvents: async (events, context) => {
			for (const event of events) {
				console.log(`Received event: '${JSON.stringify(event.body)}' from partition: '${context.partitionId}' and consumer group: '${context.consumerGroup}'`);
			}
			// Update the checkpoint.
			await context.updateCheckpoint(events[events.length - 1]);
		},

		processError: async (err, context) => {
			console.log(`Error : ${err}`);
		},
	});

	// After 30 seconds, stop processing.
	await new Promise((resolve) => {
		setTimeout(async () => {
			await subscription.close();
			await consumerClient.close();
			resolve();
		}, 30000);
	});
}

main().catch((err) => {
	console.log("Error occurred: ", err);
});
