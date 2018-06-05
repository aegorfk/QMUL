// Add random generated bookings for performance analysis

function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

var drivers = db.drivers.find();
var operators = db.operators.find();
var clients = db.clients.find();

var randBookings = [];

for (var i=0; i < 2000; i++) {
	var date = new Date(2017, getRandomInt(8, 11), getRandomInt(1, 31), getRandomInt(0, 23), getRandomInt(0, 59));
	var randDriver = drivers[getRandomInt(0, drivers.length()-1)];
	var randOperator = operators[getRandomInt(0, operators.length()-1)];
	var randClient = clients[getRandomInt(0, clients.length()-1)];
	randBookings.push({
		'driver': {
			'driverId': randDriver._id,
			'percentageOfReceipt': randDriver.percentageOfReceipt,
			'salary': randDriver.salary,
			'carRegistrationNumber': randDriver.cars[0].registrationNumber
		},
		'operatorId': randOperator._id,
		'clientId': randClient._id,
		'dateTime': date,
		'departurePoint': 'Departure ' + i,
		'destinationPoint': 'Destination ' + i,
		'amount': getRandomInt(20, 150),
		'dateOfPayment': date,
		'testBooking': true
	});
}

db.bookings.insertMany(randBookings);