// find regular bookings which may happen in the specified day
// regularType is unstructured field which makes it hard to anaylise only with querry. We assume that it will be analysed by some program or operator
db.regularBookings.find({
    'subscriptionStartDate': { $lte: ISODate("2017-11-20T00:00:00.000Z")},
    'subscriptionEndDate': { $gte: ISODate("2017-12-11T00:00:00.000Z")}
});

// find regular bookings which may happen today
db.regularBookings.find({
    'subscriptionStartDate': { $lte: new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate())},
    'subscriptionEndDate': { $gte: new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 23, 59, 59)}
});