// Total company revenue for the whole period of taxi company existence
db.revenue.aggregate([
    {
        $group: {
            '_id': null,
            'totalCompanyRevenue': { $sum: '$companyWage' },
        }
    }
]);