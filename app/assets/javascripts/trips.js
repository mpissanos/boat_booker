$(document).ready(function () {
  
  $('#calendar').fullCalendar({
    events: '/trips.json',
    eventClick: function (event) {
      let event = getEventById('a')
     
      $("#modalTitle").html(event.title);
      $("#modalBoatName").html(event.boat.name);
      $("#eventUrl").attr('href', event.url);
      $("#calendarModal").modal();
    },
  })


});

class Trip {
  constructor(location, price, passengers, start_time,
              end_time, date, complete) {
    this.location = location;
    this.price = price;
    this.passengers = passengers;
    this.start_time = start_time
    this.end_time = end_time
    this.date = date;
    this.complete = complete;
  }
}


$(function () {
  
})