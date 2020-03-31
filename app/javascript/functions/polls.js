// Each date choice card
const dateChoices = document.querySelectorAll(".card-date");
// The hidden input field to record the user's choices
const dateInput = document.getElementById("date-votes");

const updateDateInput = (id) => {
  if (dateInput.value === "") {
    // If there's no input yet, add the choice
    dateInput.value = id;
  } else {
    // Else, split the input into an array and see if chosen id is already there
    const inputsArray = dateInput.value.split(",");
    const index = inputsArray.findIndex((x) => x === id);
    if (index === -1) {
      // If it's not there, add it after a comma
      dateInput.value += `,${id}`;
    } else {
      // Else, remove it, and reset the date input
      inputsArray.splice(index, 1);
      dateInput.value = inputsArray.join();
    }
  }
};

const dateListeners = () => {
  dateChoices.forEach(date => {
    // Get the id of the date_choice via dataset
    const id = date.dataset.id;

    // If the date is already checked (user voted such previously), add to input field
    if (date.classList.contains('checked')) {
      updateDateInput(id);
    }

    date.addEventListener('click', (event) => {
      // Toggle whether the card has checked style class or not
      date.classList.toggle("checked");
      updateDateInput(id);
    });
  });
};


// Each date choice card
const locationChoices = document.querySelectorAll(".js-card-location");
// The hidden input field to record the user's choices
const locationInput = document.getElementById("location-votes");

const updateLocationInput = (id) => {
  if (locationInput.value === "") {
    // If there's no input yet, add the choice
    locationInput.value = id;
  } else {
    // Else, split the input into an array and see if chosen id is already there
    const inputsArray = locationInput.value.split(",");
    const index = inputsArray.findIndex((x) => x === id);
    if (index === -1) {
      // If it's not there, add it after a comma
      locationInput.value += `,${id}`;
    } else {
      // Else, remove it, and reset the location input
      inputsArray.splice(index, 1);
      locationInput.value = inputsArray.join();
    }
  }
};

const locationListeners = () => {
  locationChoices.forEach(location => {
    // Get the id of the location_choice via dataset
    const id = location.dataset.id;

    // If the location is already checked (user voted such previously), add to input field
    if (location.classList.contains('checked')) {
      updateLocationInput(id);
    }

    location.addEventListener('click', (event) => {
      // Toggle whether the card has checked style class or not
      location.classList.toggle("checked");
      updateLocationInput(id);
    });
  });
};


const going = document.getElementById("going");
const maybe = document.getElementById("maybe");
const no = document.getElementById("no");
const rsvp = [going, maybe, no];
const rsvpInput = document.getElementById("attendance");

const rsvpListeners = () => {
  if (going !== null && maybe !== null && no !== null) {
    rsvp.forEach(answer => {
      if (answer.classList.contains("checked")) {
        rsvpInput.value = answer.dataset.id;
      }
      answer.addEventListener('click', (event) => {
        if (answer.classList.contains("checked")) {
          answer.classList.remove("checked");
          rsvpInput.value = "";
        } else {
          going.classList.remove("checked");
          maybe.classList.remove("checked");
          no.classList.remove("checked");

          answer.classList.add("checked");
          rsvpInput.value = answer.dataset.id;
        }
      });
    });
  }
};

export { dateListeners, locationListeners, rsvpListeners };
