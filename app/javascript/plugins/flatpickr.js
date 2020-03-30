import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
require("flatpickr/dist/themes/airbnb.css");


const dateCardContainer = document.querySelector(".date-cards")

const dateDisplayOptions = { month: 'short', day: 'numeric' }
const weekDayDisplayOptions = { weekday: 'long' }
const timeDisplayOptions = { hour: '2-digit', minute: '2-digit' }

const setNewDate = (selectedDates, dateString, instance) => {
  // Here we do all the js to insert a new card with the data and refresh the timepicker
  console.log(selectedDates);
  const formattedDate = selectedDates[0].toLocaleDateString("en-US", dateDisplayOptions)
  const weekday = selectedDates[0].toLocaleDateString("en-US", weekDayDisplayOptions)
  const formattedTime = selectedDates[0].toLocaleTimeString("en-US", timeDisplayOptions);
  const utcValue = selectedDates[0].toUTCString();
  const cardHtml = buildDateCardHtml(formattedDate, weekday, formattedTime, utcValue);
 dateCardContainer.insertAdjacentHTML('beforeend', cardHtml);
 instance.clear();
}

const buildDateCardHtml = (formattedDate, weekday, time, utcValue) => {
  return `<div class="card-date">
     <div class="date-inputs">
     <h2> ${formattedDate}</h2>
     <h3> ${weekday}</h3>
     <h4> ${time}</h4>
     </div>
     <input class="form-control string optional hidden-input" type="text" value="${utcValue}" name="hangout[date_choices_attributes][]" id="hangout_date_choices_attributes">
     </div>`
}

flatpickr(".multi-datepicker", {
    mode: "multiple",
    dateFormat: "Y-m-d",
    enableTime: true,
    onClose: setNewDate
})

flatpickr(".datetimepicker", {
  enableTime: true,
  dateFormat: "Y-m-d H:i",
  disableMobile: true
})

