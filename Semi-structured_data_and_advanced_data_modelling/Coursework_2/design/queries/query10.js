//how much money the specified driver earn for the company

// drivers id and dates period should be specified by user
// in example we search for driver 0
var driver0 = db.drivers.findOne();

db.bookings.aggregate([
    {
        $match: {
            'driver.driverId': driver0._id,
            'dateTime': {
                $gte: ISODate("2017-11-01T00:00:00.000Z"),
                $lte: ISODate("2017-11-30T23:59:59.000Z")
            }
        }
    },
    {
        $group: {
            '_id': { driverId: '$driver.driverId' },
            'amountOfDriverBookings': { $sum: '$amount' }
        }
    }  
]);