import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datetimepicker", {
  enableTime: true,
  dateFormat: "Y-m-d H:i",
  disableMobile: true

})

flatpickr(".multi-datepicker", {
  mode: "multiple",
  dateFormat: "Y-m-d"
})

