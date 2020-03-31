import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
require("flatpickr/dist/themes/airbnb.css");


const DATES = []

const dateCardContainer = document.querySelector(".date-cards")

const dateDisplayOptions = { month: 'short', day: 'numeric' }
const weekDayDisplayOptions = { weekday: 'long' }
const timeDisplayOptions = { hour: '2-digit', minute: '2-digit' }


const resetContainers = () => {
  dateCardContainer.innerHTML = ""
  DATES.forEach(date => {
    const formattedDate = date.toLocaleDateString("en-US", dateDisplayOptions)
    const weekday = date.toLocaleDateString("en-US", weekDayDisplayOptions)
    const formattedTime = date.toLocaleTimeString("en-US", timeDisplayOptions);
    const inputDate = date.toString().slice(0, 24)
    const cardHtml = buildDateCardHtml(formattedDate, weekday, formattedTime, inputDate);
    dateCardContainer.insertAdjacentHTML('beforeend', cardHtml);
    const deleteButtons = document.querySelectorAll(".delete-date-card")
    console.log(deleteButtons)
    deleteButtons[deleteButtons.length - 1].addEventListener("click", () => removeDate(date))
  })
}

const removeDate = (date) => {
  const index = DATES.indexOf(date)
  DATES.splice(index, 1)
  resetContainers()
}
const setNewDate = (selectedDates, dateString, instance) => {
  // Here we do all the js to insert a new card with the data and refresh the timepicker
  DATES.push(selectedDates[0])
  resetContainers()
  instance.clear();
}

const buildDateCardHtml = (formattedDate, weekday, time, datetime) => {
  return `<div class="card-date">
    <div class="date-inputs">
    <h2> ${formattedDate}</h2>
    <h3> ${weekday}</h3>
    <h4> ${time}</h4>
    <i class="delete-date-card fas fa-times-circle fa-lg"></i>
    </div>
    <input class="form-control string optional hidden-input" type="text" value="${datetime}" name="hangout[date_choices_attributes][]" id="hangout_date_choices_attributes">
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
  disableMobile: true
})

