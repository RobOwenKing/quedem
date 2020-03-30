// Each date choice card
const dateChoices = document.querySelectorAll(".card-date");
// The hidden input field to record the user's choices
const dateInput = document.getElementById("date-votes");

const dateListeners = () => {
  dateChoices.forEach(date => {
    date.addEventListener('click', (event) => {
      // Toggle whether the card has checked style class or not
      date.classList.toggle("checked");

      // Get the id of the date_choice via dataset
      const id = date.dataset.id;
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
    });
  });
};


// Each date choice card
const locationChoices = document.querySelectorAll(".card-location");
// The hidden input field to record the user's choices
const locationInput = document.getElementById("location-votes");

const locationListeners = () => {
  locationChoices.forEach(location => {
    location.addEventListener('click', (event) => {
      // Toggle whether the card has checked style class or not
      location.classList.toggle("checked");

      // Get the id of the location_choice via dataset
      const id = location.dataset.id;
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
      answer.addEventListener('click', (event) => {
        answer.classList.toggle("checked");
        rsvpInput.value = answer.dataset.id
      });
    });
  }
};

export { dateListeners, locationListeners, rsvpListeners };
