import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
require("flatpickr/dist/themes/airbnb.css");


const dateCardContainer = document.querySelector(".date-cards")

const dateDisplayOptions = { month: 'short', day: 'numeric' }
const weekDayDisplayOptions = { weekday: 'long' }
const timeDisplayOptions = { hour: '2-digit', minute: '2-digit' }

const setNewDate = (selectedDates, dateString, instance) => {
  // Here we do all the js to insert a new card with the data and refresh the timepicker
  const formattedDate = selectedDates[0].toLocaleDateString("en-US", dateDisplayOptions)
  const weekday = selectedDates[0].toLocaleDateString("en-US", weekDayDisplayOptions)
  const formattedTime = selectedDates[0].toLocaleTimeString("en-US", timeDisplayOptions);
  window.testdate = selectedDates[0]
  const inputDate = selectedDates[0].toString().slice(0, 24)
  const cardHtml = buildDateCardHtml(formattedDate, weekday, formattedTime, inputDate);
 dateCardContainer.insertAdjacentHTML('beforeend', cardHtml);
 instance.clear();
}

const setCloseDate = (selectedDates, dateString, instance) => {
  const container = document.querySelector('.closeTimeContainer');
  const formattedDate = selectedDates[0].toLocaleDateString("en-US", dateDisplayOptions)
  const weekday = selectedDates[0].toLocaleDateString("en-US", weekDayDisplayOptions)
  const formattedTime = selectedDates[0].toLocaleTimeString("en-US", timeDisplayOptions);
  const card = `<div class="card-date">
                   <div class="date-inputs">
                   <h2> ${formattedDate}</h2>
                   <h3> ${weekday}</h3>
                   <h4> ${formattedTime}</h4>
                   </div>
                 </div>`
  container.innerHTML = card
}

const buildDateCardHtml = (formattedDate, weekday, time, datetime) => {
  return `<div class="date-card-container">
    <div class="card-date">
    <div class="date-inputs">
    <h2> ${formattedDate}</h2>
    <h3> ${weekday}</h3>
    <h4> ${time}</h4>
    </div>
    <input class="form-control string optional hidden-input" type="text" value="${datetime}" name="hangout[date_choices_attributes][]" id="hangout_date_choices_attributes">
    </div>
    </div>`
}

flatpickr(".multi-datepicker", {
    dateFormat: "Y-m-d",
    enableTime: true,
    onClose: setNewDate,
    disableMobile: true
})

flatpickr(".datetimepicker", {
  enableTime: true,
  dateFormat: "Y-m-d H:i",
  disableMobile: true,
  onClose: setCloseDate
})

