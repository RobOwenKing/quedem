import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

const dateCardContainer = document.querySelector(".date-cards")

const dateDisplayOptions = { month: 'short', day: 'numeric' }
const weekDayDisplayOptions = { weekday: 'short' }
const timeDisplayOptions = { hour: '2-digit', minute: '2-digit' }

const setNewDate = (selectedDates, dateString, instance) => {
  // Here we do all the js to insert a new card with the data and refresh the timepicker
  console.log(selectedDates);
  const formattedDate = selectedDates[0].toLocaleDateString("en-US", dateDisplayOptions)
  const weekday = selectedDates[0].toLocaleDateString("en-US", weekDayDisplayOptions)
  const formattedTime = selectedDates[0].toLocaleTimeString("en-US", timeDisplayOptions);
  const cardHtml = buildDateCardHtml(formattedDate, weekday, formattedTime);
 dateCardContainer.insertAdjacentHTML('beforeend', cardHtml);
 instance.clear();
}

const buildDateCardHtml = (formattedDate, weekday, time) => {
  return `<div class="card-date">
     <h2> ${formattedDate}</h2>
     <h3> ${weekday} ${time} </h3>
     <input class="form-control string optional hidden-input" type="text" value="${formattedDate}" name="hangout[date_choices_attributes][]" id="hangout_date_choices_attributes">
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

