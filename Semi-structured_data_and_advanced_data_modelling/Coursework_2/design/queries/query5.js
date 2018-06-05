// Find the most expensive bookings
// if the price is the same, latest bookings should be higher in the output result

// the first way
db.bookings.aggregate([
	{ $sort : {amount  : -1, dateOfPayment: -1} },
    { $limit: 10 }
]);
   
// the second way  
db.bookings.find()
     .sort({amount  : -1, dateOfPayment: -1} )
     .limit(10);