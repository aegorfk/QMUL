conn = new Mongo();
db = conn.getDB('taxiCompany');

// drop the previous database with the same name if exists
db.dropDatabase();

db.drivers.insert({
    firstName: 'Andrey',
    lastName: 'Newman',
    dateOfBirth: new Date('1987-12-12'),
    address: {
        country: 'UK',
        city: 'London',
        street: 'Oxford street',
        flat: 12
    },
    contactDetails: {
        telephone: '+44 020 7033 3920',
        email: 'andrey.newman@gmail.com'
    },
    dateOfEmployment: new Date('2008-01-12'),
    //dateOfDismiss: new Date('2008-01-12'), // if there is no such field then the employee is currently working
    //salary: 20000, // if there is no such field then the driver receives percentage from each ride
    percentageOfReceipt: 40, // if there is no such field then the driver receives fixed salary
    shift: {
		startTime: '08:00',
		endTime: '16:00'
	},
    cars: [
        {
            registrationNumber : '123AJOO22MLG',
            age : 3,
            dateOfLastMOTTest: new Date('2017-07-11'),
            carStatus : 'roadworthy' //roadworthy, in for service, awaiting repair, written off
        }
    ]
});

db.operators.insert({
    firstName: 'Anny',
    lastName: 'Winehouse',
    dateOfBirth: new Date('1997-01-06'),
    address: {
        country: 'UK',
        city: 'London',
        street: 'Regent street',
        flat: 2
    },
    contactDetails: {
        telephone: '+44 020 8659 3794',
        email: 'anny1997@gmail.com'
    },
    dateOfEmployment: new Date('2016-05-22'),
    // dateOfDismiss: new Date('2008-01-12'), // if there is no such field then the employee is currently working
    salary: 20000,
    shift: {
		startTime: '08:00',
		endTime: '16:00'
	}
});

db.clients.insert({
    _id: '+44 020 8659 9094',
    firstName: 'Jack',
    lastName: 'Theripper',
    clientType: 'corporate', // private
    email: 'jacktheripper@gmail.com'
});

db.regularBookings.insert({
    clientId: '+44 020 8659 3794',
    regularType: 'once a week', // daily bookings
    subscriptionStartDate: new Date('2017-09-30'),
    subscriptionEndDate: new Date('2018-09-30'),
    departurePoint: 'Heathrow Airport Terminal 3',
    destinationPoint: 'The Royal London Hospital',
    lastArrivalDateTime: new Date('2017-11-25T15:30:00Z')
});

var driver = db.drivers.findOne();
var operator = db.operators.findOne();
var client = db.clients.findOne();
var regularBooking = db.regularBookings.findOne();

db.bookings.insert({
    driver: {
		driverId: driver._id,
		// salary: driver.salary, // presense of the field depends on the driver rate type
		percentageOfReceipt: driver.percentageOfReceipt, // presense of the field depends on the driver rate type
		carRegistrationNumber: driver.cars[0].registrationNumber
	},
    operatorId: operator._id,
    clientId: client._id,
    dateTime: new Date('2017-09-30T15:30:00Z'),
    departurePoint: regularBooking.departurePoint,
    destinationPoint: regularBooking.destinationPoint,
    regularBookingId: regularBooking._id, // optional field. If do not have, that is not regular booking
    amount: 120,
    dateOfPayment: new Date('2017-09-30'), // if there is no dateOfPayment then it has not been paid yet
});

db.revenue.insert({
    driverId: driver._id,
    startDate: new Date('2017-09-01'),
    endDate: new Date('2017-09-30'),
    driverWage: 48,
    companyWage: 72
});