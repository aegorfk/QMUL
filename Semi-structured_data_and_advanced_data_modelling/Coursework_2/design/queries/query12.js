// usage of skip

var pageNumber = 1;
var limitPerPage = 5;
db.bookings.find().skip(limitPerPage * (pageNumber - 1) ).limit(limitPerPage);