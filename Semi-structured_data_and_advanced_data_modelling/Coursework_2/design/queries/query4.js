// how many unpaid rides(bookings) we have?
db.bookings.find({
    'dateOfPayment': { $exists: false }
}).count();

// get all unpaid rides(bookings)
db.bookings.find({
    'dateOfPayment': { $exists: false }
});

// how much money should we receive from unpaid bookings?
db.bookings.aggregate(
    { 
        $match: {'dateOfPayment': { $exists: false }}
    },
    {
        $group: { _id : 'totalUnpaidAmount', sum : { $sum: "$amount" }}
    } 
);