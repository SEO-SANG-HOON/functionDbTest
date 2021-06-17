db.getCollection('devices').aggregate(
[
    {$match:{"device.macAddr": "3cb98f20ddd0b2a71b2a2ff29df1ea9e3b575b49edaffb4837a611b33949a208"}},
    {
        $addFields: {
            leftRear: "$sensor.leftRear.power.powerLevel",
            leftFront: "$sensor.leftFront.power.powerLevel",
            rightFront: "$sensor.rightFront.power.powerLevel"
        }
    },
    {$project: {
        _id:0,
        lastUpdatedAt:1,
        leftRear:1,
        leftFront:1,
        rightFront:1
        //"sensor.leftFront.timer":1,
        //"sensor.rightFront.timer":1,
        //"sensor.leftRear.timer":1,
        //"sensor.leftFront.power":1,
        //"sensor.rightFront.power":1,
        //"sensor.leftRear.power":1
    }}
]
)