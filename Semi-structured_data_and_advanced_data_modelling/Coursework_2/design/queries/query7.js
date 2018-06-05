// Total drivers' revenue for specified month
db.revenue.aggregate([
    {
        $match: {
            'startDate': { $gte: ISODate("2017-11-01T00:00:00.000Z") },
            'endDate': { $lte: ISODate("2017-11-30T00:00:00.000Z") }
        }
    },
    {
        $group: {
            '_id': {
                'startDate': "$startDate",
                'endDate': '$endDate'
            },
            'totalDriversMonthRevenue': { $sum: '$driverWage' },
        }
    }
]);