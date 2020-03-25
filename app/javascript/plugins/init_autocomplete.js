import places from 'places.js';

const generateLocationTitleInput = (index, value) => {
  return `<input class="form-control string optional" type="text" value="${value}" name="hangout[location_choices_attributes][${index}][title]" id="hangout_location_choices_attributes_${index}_title">`
}
const initAutocomplete = () => {
  const addressInput = document.getElementById('place-choice');
  if (addressInput) {
    const container = document.querySelector(".location-choices-container")
    const autocomplete = places({ container: addressInput });
    autocomplete.on("change", (e) => {
      console.log(e)
      const newInput = generateLocationTitleInput(0, e.suggestion)
      container.insertAdjacentHTML('beforeend', newInput)
    })
  }
};

export { initAutocomplete };
