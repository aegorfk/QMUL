// Update example if we want to fire driver 8
var driver8 = db.drivers.find({})[8];

db.drivers.update({_id: driver8._id}, {$set: {dateOfDismiss: new Date()}});

// update all drivers as they passed medical examination
var dateOfMedicalExamination = new Date();
db.drivers.update({}, 
	{$set: {dateOfMedicalExamination: dateOfMedicalExamination}},
	{multi: true}
);