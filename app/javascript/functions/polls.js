const dateChoices = document.querySelectorAll(".card-date");
const dateInput = document.getElementById("date-votes");

const createDateListeners = () => {
  dateChoices.forEach(date => {
    date.addEventListener('click', (event) => {
      date.classList.toggle("checked");

      if (dateInput.value === "") {
        dateInput.value = date.dataset.id;
      } else {
        dateInput.value += `,${date.dataset.id}`;
      }
    });
  });
};

export { createDateListeners };
