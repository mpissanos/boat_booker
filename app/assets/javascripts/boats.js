$(document).ready(function () {
  loadBoats();
});
  
  function loadBoats() {
    $.getJSON("/boats.json", function (data) {
      let boat_data = "";
      $.each(data, function (key, value) {
        let id = value.id
        boat_data += '<tr>';
        boat_data += '<td>' + value.name + '</td>';
        boat_data += '<td>' + value.boat_type + '</td>';
        boat_data += '<td>' + value.capacity + '</td>';
        boat_data += '<td>' + value.trips.length + '</td>'
        boat_data += '</tr>';
      })
      $('#boat-table').append(boat_data)
    })
  }

  // function addBoat() {
  //   $('#new-boat').on('submit', function () {
  //     event.preventDefault();
  //     $("#boat-table").clear();
  //     let values = $(this).serialize()
  //     let posting = $.post('/boats', values)
  //     posting.done(function (data) {
  //       $.each(data, function (key, value) {
  //         let id = value.id
  //         boat_data += '<tr>';
  //         boat_data += '<td>' + value.name + '</td>';
  //         boat_data += '<td>' + value.boat_type + '</td>';
  //         boat_data += '<td>' + value.capacity + '</td>';
  //         boat_data += '<td>' + value.trips.length + '</td>'
  //         boat_data += '</tr>';
  //       })
  //       loadBoats();
  //       $('#boat-table').append(boat_data)
  //     })
  //   })
  // }


 