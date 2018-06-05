conn = new Mongo();
db = conn.getDB('taxiCompany');

// Insert drivers
db.drivers.insert([
	{
		firstName: 'Natalia',
		lastName: 'Govor',
		dateOfBirth: new Date('1992-02-04'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Mile End Road',
			flat: 2
		},
		contactDetails: {
			telephone: '+44 020 5673 0000',
			email: 'Nata$ha@gmail.com'
		},
		dateOfEmployment: new Date('2017-04-22'),
		salary: 150,
		shift: {
			startTime: '00:00',
			endTime: '08:00'
		},
		cars: [
			{
				registrationNumber : '321AJOO45NLE',
				age : 1,
				dateOfLastMOTTest: new Date('2017-07-11'),
				carStatus : 'in for service'
			}
		]
	},
	{
		firstName: 'Ekaterina',
		lastName: 'Lyapina',
		dateOfBirth: new Date('1994-07-22'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Claredale street',
			flat: 62
		},
		contactDetails: {
			telephone: '+44 020 7689 4567',
			email: 'Lyapinaonelove@gmail.com'
		},
		dateOfEmployment: new Date('2005-11-02'),
		dateOfDismiss: new Date('2017-10-12'),
		percentageOfReceipt: 40,
		shift: {
			startTime: '16:00',
			endTime: '24:00'
		},
		cars: [
			{
				registrationNumber : '783AJ7722MLG',
				age : 3,
				dateOfLastMOTTest: new Date('2005-07-11'),
				carStatus : 'written off'
			},
			{
				registrationNumber: '7780AJ7542MLG',
				age: 2,
				dateOfLastMOTTest: new Date('2017-07-11'),
				carStatus: 'awaiting repair'
			}
		]
	},
	{
		firstName: 'Soheil',
		lastName: 'Novinfard',
		dateOfBirth: new Date('1994-06-02'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Next street',
			flat: 11
		},
		contactDetails: {
			telephone: '+44 020 6578 3966',
			email: 'soho@gmail.com'
		},
		dateOfEmployment: new Date('2016-05-02'),
		percentageOfReceipt: 40,
		shift: {
			startTime: '08:00',
			endTime: '16:00'
		},
		cars: [
			{
				registrationNumber : '45678AJOO456MLG',
				age : 5,
				dateOfLastMOTTest: new Date('2007-07-01'),
				carStatus : 'roadworthy'
			}
		]
	},
	{
		firstName: 'Maya',
		lastName: 'Royal',
		dateOfBirth: new Date('1987-12-12'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Noname street',
			flat: 45
		},
		contactDetails: {
			telephone: '+44 070 6583 4890',
			email: 'maya.royam@gmail.com'
		},
		dateOfEmployment: new Date('2015-04-23'),
		percentageOfReceipt: 10,
		shift: {
			startTime: '08:00',
			endTime: '16:00'
		},
		cars: [
			{
				registrationNumber : '123AJO00022MLG',
				age : 1,
				dateOfLastMOTTest: new Date('2007-04-12'),
				carStatus : 'roadworthy'
			}
		]
	},
	{
		firstName: 'Noman',
		lastName: 'Olddude',
		dateOfBirth: new Date('1989-03-23'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Regent street',
			flat: 24
		},
		contactDetails: {
			telephone: '+44 030 5623 9823',
			email: 'olddude@gmail.com'
		},
		dateOfEmployment: new Date('2016-01-22'),
		salary: 180,
		shift: {
			startTime: '00:00',
			endTime: '08:00'
		},
		cars: [
			{
				registrationNumber : '567KNYY22MTHD',
				age : 4,
				dateOfLastMOTTest: new Date('2013-07-11'),
				carStatus : 'in for service'
			},
			{
				registrationNumber : '156BTOM90MYD',
				age : 6,
				dateOfLastMOTTest: new Date('2015-01-01'),
				carStatus : 'roadworthy'
			},
			{
				registrationNumber : '156TNM95MYID',
				age : 2,
				dateOfLastMOTTest: new Date('2015-01-01'),
				carStatus : 'roadworthy'
			}
		]
	},
	{
		firstName: 'Roman',
		lastName: 'Leonidov',
		dateOfBirth: new Date('1990-02-02'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Uber street',
			flat: 56
		},
		contactDetails: {
			telephone: '+44 020 7033 3920',
			email: 'roman.leonidov@gmail.com'
		},
		dateOfEmployment: new Date('2017-10-02'),
		percentageOfReceipt: 35,
		shift: {
			startTime: '16:00',
			endTime: '24:00'
		},
		cars: [
			{
				registrationNumber : '378ATOO73RNT',
				age : 4,
				dateOfLastMOTTest: new Date('2009-07-11'),
				carStatus : 'roadworthy'
			}
		]
	},
	{
		firstName: 'Vladimir',
		lastName: 'Fisher',
		dateOfBirth: new Date('1980-02-15'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Abraam street',
			flat: 185
		},
		contactDetails: {
			telephone: '+44 020 5602 3492',
			email: 'fisher1980@gmail.com'
		},
		dateOfEmployment: new Date('2016-04-22'),
		salary: 130,
		shift: {
			startTime: '16:00',
			endTime: '24:00'
		},
		cars: [
			{
				registrationNumber : '673ANOO26TNP',
				age : 1,
				dateOfLastMOTTest: new Date('2016-07-12'),
				carStatus : 'awaiting repair'
			}
		]
	},
	{
		firstName: 'Jane',
		lastName: 'Doe',
		dateOfBirth: new Date('1985-05-07'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Some street',
			flat: 1
		},
		contactDetails: {
			telephone: '+44 320 6602 3592',
			email: 'jane.doe@gmail.com'
		},
		dateOfEmployment: new Date('2017-02-22'),
		percentageOfReceipt: 35,
		shift: {
			startTime: '00:00',
			endTime: '08:00'
		},
		cars: [
			{
				registrationNumber : '683ANMO38TNP',
				age : 2,
				dateOfLastMOTTest: new Date('2015-08-10'),
				carStatus : 'roadworthy'
			}
		]
	}
]);

// Insert operators
// According to coursewrok description, there are 8 operators in taxi company
// the 1st operator is added in create_db.js
db.operators.insert([
	/*2*/
	{
		firstName: 'Lolly',
		lastName: 'Fleming',
		dateOfBirth: new Date('1986-05-16'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Forster street',
			flat: 2
		},
		contactDetails: {
			telephone: '+44 560 0999 5637',
			email: 'lolly@gmail.com'
		},
		dateOfEmployment: new Date('2016-05-29'),
		salary: 185,
		shift: {
			startTime: '08:00',
			endTime: '16:00'
		}
	},
	/*3*/
	{
		firstName: 'Kate',
		lastName: 'Katalonian',
		dateOfBirth: new Date('1983-09-06'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Gate street',
			flat: 298
		},
		contactDetails: {
			telephone: '+44 880 8909 5679',
			email: 'hateful_kate@gmail.com'
		},
		dateOfEmployment: new Date('2017-12-27'),
		salary: 100,
		shift: {
			startTime: '00:00',
			endTime: '08:00'
		}
	},
	/*4*/
	{
		firstName: 'Mary',
		lastName: 'Waller',
		dateOfBirth: new Date('1999-06-16'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Timmons street',
			flat: 45
		},
		contactDetails: {
			telephone: '+44 678 3956 0954',
			email: 'mary_waller@gmail.com'
		},
		dateOfEmployment: new Date('2017-02-07'),
		salary: 120,
		shift: {
			startTime: '16:00',
			endTime: '24:00'
		}
	},
	/*5*/
	{
		firstName: 'Rosy',
		lastName: 'White',
		dateOfBirth: new Date('1995-11-24'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Dutton street',
			flat: 25
		},
		contactDetails: {
			telephone: '+44 020 0000 9374',
			email: 'rosesarered@gmail.com'
		},
		dateOfEmployment: new Date('2014-08-02'),
		salary: 98,
		shift: {
			startTime: '00:00',
			endTime: '08:00'
		}
	},
	/*6*/
	{
		firstName: 'Dean',
		lastName: 'Duncan',
		dateOfBirth: new Date('1996-05-28'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Russel square',
			flat: 26
		},
		contactDetails: {
			telephone: '+44 020 7859 3944',
			email: 'dear1996@gmail.com'
		},
		dateOfEmployment: new Date('2016-07-02'),
		salary: 105,
		shift: {
			startTime: '16:00',
			endTime: '24:00'
		}
	},
	/*7*/
	{
		firstName: 'John',
		lastName: 'Minus',
		dateOfBirth: new Date('1965-09-06'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Regent street',
			flat: 56
		},
		contactDetails: {
			telephone: '+44 020 8849 3037',
			email: 'jogny2008@gmail.com'
		},
		dateOfEmployment: new Date('2017-09-18'),
		salary: 87,
		shift: {
			startTime: '08:00',
			endTime: '16:00'
		}
	},
	/*8*/
	{
		firstName: 'Tomy',
		lastName: 'Rules',
		dateOfBirth: new Date('1990-12-24'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Saunder street',
			flat: 49
		},
		contactDetails: {
			telephone: '+44 020 5628 6588',
			email: 'tomy1997@gmail.com'
		},
		dateOfEmployment: new Date('2016-06-10'),
		salary: 120,
		shift: {
			startTime: '16:00',
			endTime: '24:00'
		}
	},
	// Dismissed operator
	{
		firstName: 'Roger',
		lastName: 'Gustman',
		dateOfBirth: new Date('1992-11-16'),
		address: {
			country: 'UK',
			city: 'London',
			street: 'Howard street',
			flat: 56
		},
		contactDetails: {
			telephone: '+44 020 6751 8956',
			email: 'roger2008@gmail.com'
		},
		dateOfEmployment: new Date('2015-06-12'),
		dateOfDismiss: new Date('2017-07-03'),
		salary: 150,
		shift: {
			startTime: '16:00',
			endTime: '24:00'
		}
	}
]);

// Insert clients
db.clients.insert([
	{
		_id: '+44 020 7692 3476',
		firstName: 'Croftoon',
		lastName: 'Clapton',
		clientType: 'private'
	},
	{
		_id: '+44 020 6573 7562',
		firstName: 'Daniel',
		lastName: 'Davidson',
		clientType: 'corporate',
		email: 'davidson@gmail.com'
	},
	{
		_id: '+44 020 1956 1994',
		firstName: 'Adam',
		lastName: 'Goodman',
		clientType: 'private',
		email: 'adam_goodman@gmail.com'
	},
	{
		_id: '+44 020 5673 1995',
		firstName: 'Harris',
		lastName: 'Jeffson',
		clientType: 'corporate',
		email: 'JeffHarris@gmail.com'
	},
	{
		_id: '+44 020 9947 4592',
		firstName: 'John',
		lastName: 'Smith',
		clientType: 'private',
		email: 'johnsmith@gmail.com'
	},
	{
		_id: '+44 020 5692 3749',
		firstName: 'Marge',
		lastName: 'Simpson',
		clientType: 'private'
	},
	{
		_id: '+44 020 6573 2037',
		firstName: 'Salomon',
		lastName: 'Saunder',
		clientType: 'private',
		email: 'salomon@gmail.com'
	},
	{
		_id: '+44 020 0001 0000',
		firstName: 'Tracey',
		lastName: 'Smith',
		clientType: 'private',
		email: 'traceysmith@gmail.com'
	},
	{
		_id: '+44 020 6558 0206',
		firstName: 'Vaughan',
		lastName: 'White',
		clientType: 'private'
	},
	{
		_id: '+44 020 6575 3990',
		firstName: 'Young',
		lastName: 'Ward',
		clientType: 'private'
	},
	{
		_id: '+44 000 0000 0007',
		firstName: 'James',
		lastName: 'Bond',
		clientType: 'corporate',
		email: 'agent007@sis.ac.uk'
	},
	{
		_id: '+44 022 5575 3991',
		firstName: 'Harry',
		lastName: 'Potter',
		clientType: 'private',
		email: 'harry.wizard@gmail.com'
	}
]);

// Insert bookings
var drivers = db.drivers.find();
var operators = db.operators.find();
var clients = db.clients.find();

// Corporate clients with regular bookings
var jackTheRipper = db.clients.findOne({lastName: 'Theripper'});
var jamesBond = db.clients.findOne({lastName: 'Bond'});

// Insert regular booking for James Bond
db.regularBookings.insert([
	{
		clientId: jamesBond._id,
		regularType: 'once a week', // daily bookings
		subscriptionStartDate: new Date('2017-10-01'),
		subscriptionEndDate: new Date('2017-12-01'),
		departurePoint: 'SIS',
		destinationPoint: 'Buckingham Palace',
		lastArrivalDateTime: new Date('2017-11-28T09:30:00Z')
	}
]);

//Insert regular bookings for Jack Theripper
var jackTheRippperRegBooking = db.regularBookings.findOne({destinationPoint: 'The Royal London Hospital'});
db.bookings.insert([
	{
		driver: {
			driverId: drivers[0]._id,
			percentageOfReceipt: drivers[0].percentageOfReceipt,
			carRegistrationNumber: drivers[0].cars[0].registrationNumber
		},
		operatorId: operators[1]._id,
		clientId: jackTheRipper._id,
		dateTime: new Date('2017-10-07T15:30:00Z'),
		departurePoint: jackTheRippperRegBooking.departurePoint,
		destinationPoint: jackTheRippperRegBooking.destinationPoint,
		regularBookingId: jackTheRippperRegBooking._id,
		amount: 120,
		dateOfPayment: new Date('2017-10-07')
	},
	{
		driver: {
			driverId: drivers[3]._id,
			percentageOfReceipt: drivers[3].percentageOfReceipt,
			carRegistrationNumber: drivers[3].cars[0].registrationNumber
		},
		operatorId: operators[1]._id,
		clientId: jackTheRipper._id,
		dateTime: new Date('2017-10-14T15:30:00Z'),
		departurePoint: jackTheRippperRegBooking.departurePoint,
		destinationPoint: jackTheRippperRegBooking.destinationPoint,
		regularBookingId: jackTheRippperRegBooking._id,
		amount: 122,
		dateOfPayment: new Date('2017-10-14')
	},
	{
		driver: {
			driverId: drivers[4]._id,
			percentageOfReceipt: drivers[4].percentageOfReceipt,
			carRegistrationNumber: drivers[4].cars[0].registrationNumber
		},
		operatorId: operators[0]._id,
		clientId: jackTheRipper._id,
		dateTime: new Date('2017-10-21T15:30:00Z'),
		departurePoint: jackTheRippperRegBooking.departurePoint,
		destinationPoint: jackTheRippperRegBooking.destinationPoint,
		regularBookingId: jackTheRippperRegBooking._id,
		amount: 122,
		dateOfPayment: new Date('2017-10-28')
	},
	{
		driver: {
			driverId: drivers[0]._id,
			percentageOfReceipt: drivers[0].percentageOfReceipt,
			carRegistrationNumber: drivers[0].cars[0].registrationNumber
		},
		operatorId: operators[1]._id,
		clientId: jackTheRipper._id,
		dateTime: new Date('2017-10-28T15:30:00Z'),
		departurePoint: jackTheRippperRegBooking.departurePoint,
		destinationPoint: jackTheRippperRegBooking.destinationPoint,
		regularBookingId: jackTheRippperRegBooking._id,
		amount: 125,
		dateOfPayment: new Date('2017-10-28')
	},
	{
		driver: {
			driverId: drivers[0]._id,
			percentageOfReceipt: drivers[0].percentageOfReceipt,
			carRegistrationNumber: drivers[0].cars[0].registrationNumber
		},
		operatorId: operators[0]._id,
		clientId: jackTheRipper._id,
		dateTime: new Date('2017-11-04T15:30:00Z'),
		departurePoint: jackTheRippperRegBooking.departurePoint,
		destinationPoint: jackTheRippperRegBooking.destinationPoint,
		regularBookingId: jackTheRippperRegBooking._id,
		amount: 120,
		dateOfPayment: new Date('2017-11-04')
	},
	{
		driver: {
			driverId: drivers[4]._id,
			percentageOfReceipt: drivers[4].percentageOfReceipt,
			carRegistrationNumber: drivers[4].cars[0].registrationNumber
		},
		operatorId: operators[6]._id,
		clientId: jackTheRipper._id,
		dateTime: new Date('2017-11-11T15:30:00Z'),
		departurePoint: jackTheRippperRegBooking.departurePoint,
		destinationPoint: jackTheRippperRegBooking.destinationPoint,
		regularBookingId: jackTheRippperRegBooking._id,
		amount: 121,
		dateOfPayment: new Date('2017-11-11')
	},
	{
		driver: {
			driverId: drivers[3]._id,
			percentageOfReceipt: drivers[3].percentageOfReceipt,
			carRegistrationNumber: drivers[3].cars[0].registrationNumber
		},
		operatorId: operators[0]._id,
		clientId: jackTheRipper._id,
		dateTime: new Date('2017-11-18T15:30:00Z'),
		departurePoint: jackTheRippperRegBooking.departurePoint,
		destinationPoint: jackTheRippperRegBooking.destinationPoint,
		regularBookingId: jackTheRippperRegBooking._id,
		amount: 125,
		dateOfPayment: new Date('2017-11-18')
	},
	{
		driver: {
			driverId: drivers[3]._id,
			percentageOfReceipt: drivers[3].percentageOfReceipt,
			carRegistrationNumber: drivers[3].cars[0].registrationNumber
		},
		operatorId: operators[0]._id,
		clientId: jackTheRipper._id,
		dateTime: new Date('2017-11-25T15:30:00Z'),
		departurePoint: jackTheRippperRegBooking.departurePoint,
		destinationPoint: jackTheRippperRegBooking.destinationPoint,
		regularBookingId: jackTheRippperRegBooking._id,
		amount: 122,
		dateOfPayment: new Date('2017-11-25')
	}
]);

//Insert regular bookings for James Bond
var jamesBondRegBooking = db.regularBookings.findOne({departurePoint: 'SIS'});
db.bookings.insert([
	{
		driver: {
			driverId: drivers[3]._id,
			percentageOfReceipt: drivers[3].percentageOfReceipt,
			carRegistrationNumber: drivers[3].cars[0].registrationNumber
		},
		operatorId: operators[6]._id,
		clientId: jamesBond._id,
		dateTime: new Date('2017-10-03T09:30:00Z'),
		departurePoint: jamesBondRegBooking.departurePoint,
		destinationPoint: jamesBondRegBooking.destinationPoint,
		regularBookingId: jamesBondRegBooking._id,
		amount: 40,
		dateOfPayment: new Date('2017-10-03')
	},
	{
		driver: {
			driverId: drivers[1]._id,
			percentageOfReceipt: drivers[1].percentageOfReceipt,
			carRegistrationNumber: drivers[1].cars[0].registrationNumber
		},
		operatorId: operators[1]._id,
		clientId: jamesBond._id,
		dateTime: new Date('2017-10-10T09:30:00Z'),
		departurePoint: jamesBondRegBooking.departurePoint,
		destinationPoint: jamesBondRegBooking.destinationPoint,
		regularBookingId: jamesBondRegBooking._id,
		amount: 40,
		dateOfPayment: new Date('2017-10-10')
	},
	{
		driver: {
			driverId: drivers[1]._id,
			percentageOfReceipt: drivers[1].percentageOfReceipt,
			carRegistrationNumber: drivers[1].cars[0].registrationNumber
		},
		operatorId: operators[0]._id,
		clientId: jamesBond._id,
		dateTime: new Date('2017-10-17T09:30:00Z'),
		departurePoint: jamesBondRegBooking.departurePoint,
		destinationPoint: jamesBondRegBooking.destinationPoint,
		regularBookingId: jamesBondRegBooking._id,
		amount: 42,
		dateOfPayment: new Date('2017-10-17')
	},
	{
		driver: {
			driverId: drivers[4]._id,
			percentageOfReceipt: drivers[4].percentageOfReceipt,
			carRegistrationNumber: drivers[4].cars[0].registrationNumber
		},
		operatorId: operators[0]._id,
		clientId: jamesBond._id,
		dateTime: new Date('2017-10-24T09:30:00Z'),
		departurePoint: jamesBondRegBooking.departurePoint,
		destinationPoint: jamesBondRegBooking.destinationPoint,
		regularBookingId: jamesBondRegBooking._id,
		amount: 45,
		dateOfPayment: new Date('2017-10-24')
	},
	{
		driver: {
			driverId: drivers[0]._id,
			percentageOfReceipt: drivers[0].percentageOfReceipt,
			carRegistrationNumber: drivers[0].cars[0].registrationNumber
		},
		operatorId: operators[0]._id,
		clientId: jamesBond._id,
		dateTime: new Date('2017-10-31T09:30:00Z'),
		departurePoint: jamesBondRegBooking.departurePoint,
		destinationPoint: jamesBondRegBooking.destinationPoint,
		regularBookingId: jamesBondRegBooking._id,
		amount: 43,
		dateOfPayment: new Date('2017-10-31')
	},
	{
		driver: {
			driverId: drivers[3]._id,
			percentageOfReceipt: drivers[3].percentageOfReceipt,
			carRegistrationNumber: drivers[3].cars[0].registrationNumber
		},
		operatorId: operators[1]._id,
		clientId: jamesBond._id,
		dateTime: new Date('2017-11-07T09:30:00Z'),
		departurePoint: jamesBondRegBooking.departurePoint,
		destinationPoint: jamesBondRegBooking.destinationPoint,
		regularBookingId: jamesBondRegBooking._id,
		amount: 40,
		dateOfPayment: new Date('2017-11-07')
	},
	{
		driver: {
			driverId: drivers[0]._id,
			percentageOfReceipt: drivers[0].percentageOfReceipt,
			carRegistrationNumber: drivers[0].cars[0].registrationNumber
		},
		operatorId: operators[6]._id,
		clientId: jamesBond._id,
		dateTime: new Date('2017-11-14T09:30:00Z'),
		departurePoint: jamesBondRegBooking.departurePoint,
		destinationPoint: jamesBondRegBooking.destinationPoint,
		regularBookingId: jamesBondRegBooking._id,
		amount: 45,
		dateOfPayment: new Date('2017-11-14')
	},
	{
		driver: {
			driverId: drivers[3]._id,
			percentageOfReceipt: drivers[3].percentageOfReceipt,
			carRegistrationNumber: drivers[3].cars[0].registrationNumber
		},
		operatorId: operators[6]._id,
		clientId: jamesBond._id,
		dateTime: new Date('2017-11-21T09:30:00Z'),
		departurePoint: jamesBondRegBooking.departurePoint,
		destinationPoint: jamesBondRegBooking.destinationPoint,
		regularBookingId: jamesBondRegBooking._id,
		amount: 40,
		dateOfPayment: new Date('2017-11-21')
	},
	{
		driver: {
			driverId: drivers[3]._id,
			percentageOfReceipt: drivers[3].percentageOfReceipt,
			carRegistrationNumber: drivers[3].cars[0].registrationNumber
		},
		operatorId: operators[0]._id,
		clientId: jamesBond._id,
		dateTime: new Date('2017-11-28T09:30:00Z'),
		departurePoint: jamesBondRegBooking.departurePoint,
		destinationPoint: jamesBondRegBooking.destinationPoint,
		regularBookingId: jamesBondRegBooking._id,
		amount: 42,
		dateOfPayment: new Date('2017-11-28')
	}
]);

// First part of the day booking (shift 08:00-16:00)
db.bookings.insert([
	{
		driver: {
			driverId: drivers[0]._id,
			percentageOfReceipt: drivers[0].percentageOfReceipt,
			carRegistrationNumber: drivers[0].cars[0].registrationNumber
		},
		operatorId: operators[1]._id,
		clientId: clients[11]._id,
		dateTime: new Date('2017-10-02T08:30:00Z'),
		departurePoint: 'Private drive 10',
		destinationPoint: 'Kings Cross Station',
		amount: 65,
		dateOfPayment: new Date('2017-09-01')
	},
	{
		driver: {
			driverId: drivers[0]._id,
			percentageOfReceipt: drivers[0].percentageOfReceipt,
			carRegistrationNumber: drivers[0].cars[0].registrationNumber
		},
		operatorId: operators[1]._id,
		clientId: clients[10]._id,
		dateTime: new Date('2017-10-10T10:30:00Z'),
		departurePoint: 'Somerset house',
		destinationPoint: 'St Pancras Station',
		amount: 50,
		dateOfPayment: new Date('2017-10-10')
	}
]);

// Second part of the day booking (shift 16:00-24:00)
db.bookings.insert([
	{
		driver: {
			driverId: drivers[2]._id,
			percentageOfReceipt: drivers[2].percentageOfReceipt,
			carRegistrationNumber: drivers[2].cars[1].registrationNumber
		},
		operatorId: operators[3]._id,
		clientId: clients[7]._id,
		dateTime: new Date('2017-10-01T18:30:00Z'),
		departurePoint: 'Ritz Hotel',
		destinationPoint: 'Royal Opera House',
		amount: 40,
		dateOfPayment: new Date('2017-10-01')
	},
	{
		driver: {
			driverId: drivers[7]._id,
			percentageOfReceipt: drivers[7].percentageOfReceipt,
			carRegistrationNumber: drivers[7].cars[0].registrationNumber
		},
		operatorId: operators[7]._id,
		clientId: clients[9]._id,
		dateTime: new Date('2017-11-20T20:00:00Z'),
		departurePoint: 'Genesis Cinema',
		destinationPoint: 'Roman Road 13',
		amount: 15
	},
	{
		driver: {
			driverId: drivers[6]._id,
			percentageOfReceipt: drivers[6].percentageOfReceipt,
			carRegistrationNumber: drivers[6].cars[0].registrationNumber
		},
		operatorId: operators[5]._id,
		clientId: clients[8]._id,
		dateTime: new Date('2017-11-25T19:15:00Z'),
		departurePoint: 'Camden Town',
		destinationPoint: 'Wimbledon 10',
		amount: 85,
		dateOfPayment: new Date('2017-11-25')
	}
]);

//Late night bookings (shift 00:00-08:00)
db.bookings.insert([
	{
		driver: {
			driverId: drivers[1]._id,
			percentageOfReceipt: drivers[1].percentageOfReceipt,
			carRegistrationNumber: drivers[1].cars[0].registrationNumber
		},
		operatorId: operators[2]._id,
		clientId: clients[1]._id,
		dateTime: new Date('2017-11-01T02:10:00Z'),
		departurePoint: 'Picadilly Institute',
		destinationPoint: 'Mile End Road, 210',
		amount: 90,
		dateOfPayment: new Date('2017-11-01')
	},
	{
		driver: {
			driverId: drivers[5]._id,
			percentageOfReceipt: drivers[5].percentageOfReceipt,
			carRegistrationNumber: drivers[5].cars[2].registrationNumber
		},
		operatorId: operators[4]._id,
		clientId: clients[3]._id,
		dateTime: new Date('2017-11-01T01:30:00Z'),
		departurePoint: 'The Box Soho',
		destinationPoint: 'Kings Road, 4',
		amount: 130,
		dateOfPayment: new Date('2017-11-01')
	},
	{
		driver: {
			driverId: drivers[8]._id,
			percentageOfReceipt: drivers[8].percentageOfReceipt,
			carRegistrationNumber: drivers[8].cars[0].registrationNumber
		},
		operatorId: operators[2]._id,
		clientId: clients[5]._id,
		dateTime: new Date('2017-11-01T02:10:00Z'),
		departurePoint: 'Sky Garden',
		destinationPoint: 'New-Cross Road, 10',
		amount: 125,
		dateOfPayment: new Date('2017-11-01')
	},
	{
		driver: {
			driverId: drivers[8]._id,
			percentageOfReceipt: drivers[8].percentageOfReceipt,
			carRegistrationNumber: drivers[8].cars[0].registrationNumber
		},
		operatorId: operators[4]._id,
		clientId: clients[5]._id,
		dateTime: new Date('2017-11-18T01:20:00Z'),
		departurePoint: 'Ice Bar London',
		destinationPoint: 'Windsor Gardens, 47',
		amount: 65,
		dateOfPayment: new Date('2017-11-18')
	},
	{
		driver: {
			driverId: drivers[1]._id,
			percentageOfReceipt: drivers[1].percentageOfReceipt,
			carRegistrationNumber: drivers[1].cars[0].registrationNumber
		},
		operatorId: operators[4]._id,
		clientId: clients[6]._id,
		dateTime: new Date('2017-11-18T01:20:00Z'),
		departurePoint: 'Night Club Fabric',
		destinationPoint: 'Noname street, 17',
		amount: 60,
		dateOfPayment: new Date('2017-11-18')
	},
	{
		driver: {
			driverId: drivers[1]._id,
			percentageOfReceipt: drivers[1].percentageOfReceipt,
			carRegistrationNumber: drivers[1].cars[0].registrationNumber
		},
		operatorId: operators[2]._id,
		clientId: clients[1]._id,
		dateTime: new Date('2017-10-09T02:10:00Z'),
		departurePoint: 'Picadilly Institute',
		destinationPoint: 'Mile End Road, 210',
		amount: 90,
		dateOfPayment: new Date('2017-10-09')
	}
]);

// Insert revenue according to the bookings above
db.revenue.insert([
	// October
	{
		driverId : drivers[0]._id,
		startDate : ISODate("2017-10-01T00:00:00.000Z"),
		endDate : ISODate("2017-10-31T00:00:00.000Z"),
		driverWage : 161.2,
		companyWage : 241.8
	},
	{
		driverId : drivers[1]._id,
		startDate : ISODate("2017-10-01T00:00:00.000Z"),
		endDate : ISODate("2017-10-31T00:00:00.000Z"),
		driverWage : 150,
		companyWage : 22
	},
	{
		driverId : drivers[2]._id,
		startDate : ISODate("2017-10-01T00:00:00.000Z"),
		endDate : ISODate("2017-10-31T00:00:00.000Z"),
		driverWage : 16,
		companyWage : 24
	},
	{
		driverId : drivers[3]._id,
		startDate : ISODate("2017-10-01T00:00:00.000Z"),
		endDate : ISODate("2017-10-31T00:00:00.000Z"),
		driverWage : 64.8,
		companyWage : 97.2
	},
	{
		driverId : drivers[4]._id,
		startDate : ISODate("2017-10-01T00:00:00.000Z"),
		endDate : ISODate("2017-10-31T00:00:00.000Z"),
		driverWage : 16.7,
		companyWage : 150.3
	},
	// November
	{
		driverId : drivers[0]._id,
		startDate : ISODate("2017-11-01T00:00:00.000Z"),
		endDate : ISODate("2017-11-30T00:00:00.000Z"),
		driverWage : 66,
		companyWage : 99
	},
	{
		driverId : drivers[1]._id,
		startDate : ISODate("2017-11-01T00:00:00.000Z"),
		endDate : ISODate("2017-11-30T00:00:00.000Z"),
		driverWage : 150,
		companyWage : 0
	},
	{
		driverId : drivers[3]._id,
		startDate : ISODate("2017-11-01T00:00:00.000Z"),
		endDate : ISODate("2017-11-30T00:00:00.000Z"),
		driverWage : 147.6,
		companyWage : 221.4
	},
	{
		driverId : drivers[4]._id,
		startDate : ISODate("2017-11-01T00:00:00.000Z"),
		endDate : ISODate("2017-11-30T00:00:00.000Z"),
		driverWage : 12.1,
		companyWage : 108.9
	},
	{
		driverId : drivers[6]._id,
		startDate : ISODate("2017-11-01T00:00:00.000Z"),
		endDate : ISODate("2017-11-30T00:00:00.000Z"),
		driverWage : 29.75,
		companyWage : 55.25
	},
	{
		driverId : drivers[8]._id,
		startDate : ISODate("2017-11-01T00:00:00.000Z"),
		endDate : ISODate("2017-11-30T00:00:00.000Z"),
		driverWage : 31.5,
		companyWage : 58.5
	}
]);
