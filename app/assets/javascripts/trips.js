$(document).ready(function () {
  loadTrips();
  renderCalendar();
  attachEventListeners()
  $("#trips-table").hide();
});

function renderCalendar() {
  $('#calendar').fullCalendar({
    events: '/trips',
    eventClick: function () {
      if (event.url) {
        let eventPage = $.get('trips/new', function (page) {
          $(".content").html(page)
        })
      }
    }
  });
}

function attachEventListeners() {
  $("#show-trips-table").click(function () {
    $("#trips-table").toggle()
  });

  $(".new-trip").on('click', function () {
    let newPage = $.get('trips/new', function (page) {
      $(".content").html(page)
    })
  })

  $("#new-boat").on('click', function () {
    let newPage = $.get('boats/new', function (page) {
      $(".content").html(page)
    })
  })

  $('.new-trip').submit(function (event) {
    event.preventDefault();
    let values = $(this).serialize();
    let posting = $.post('/trips', values)
    rendercalendar();
  });
}


class Trip {
  constructor(json) {
    this.data = json;

  }

  renderTable() {
    let html = `<tr>
      <td id="tripDate"> ${this.date} </td>
      <td id="tripLocation"> ${trip.location}</td>
      <td id="tripBoatName">${trip.boat.name}</td>
      <td id="editBoatButton"><a href="/trips/${this.id}/edit link_to "Edit", edit_trip_path(trip) </a></td>
      <td id="deleteBoatButton"><a href="/trips/${this.id}" class="btn btn-primary" data-confirm="Are you sure?" method="delete">Delete</a></td>
    </tr>`

    $("#trips-table").append(hmtl);
  }
}

function loadTrips() {
  $.getJSON("/trips.json", function (data) {
    let trip_data = "";
    $.each(data, function (key, value) {
      let id = value.id
      trip_data += '<tr>';
      trip_data += '<td>' + value.date + '</td>';
      trip_data += '<td>' + value.location + '</td>';
      trip_data += '<td>' + value.boat.name + '</td>';
      trip_data += "<td><a href='/trips/" + id + "/edit' class='btn btn-primary'> Edit </a></td>";
      trip_data += "<td><a href='/trips/'" + id + "class='btn btn-primary' data-confirm='Are you sure?' method='delete'>Delete</a></td>";
      trip_data += '</tr>';
    })
    $('#trips-table').append(trip_data)
  })
}
