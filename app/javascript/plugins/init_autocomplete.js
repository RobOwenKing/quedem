import places from 'places.js';

const addPlaceCard = (place, container) => {
  const card = `<div class="">
  <h1>${place.name}</h1>
  <div>`
  container.insertAdjacentHTML('beforeend', card)
}

const generateLocationTitleInput = (index, value) => {
  return `<input class="form-control string optional hidden-input" type="text" value="${value}" name="hangout[location_choices_attributes][${index}][title]" id="hangout_location_choices_attributes_${index}_title">`
}

const generateLocationAddressInput = (index, value) => {
  return `<input class="form-control string optional hidden-input" type="text" value="${value}" name="hangout[location_choices_attributes][${index}][address]" id="hangout_location_choices_attributes_${index}_address">`
}
const initAutocomplete = () => {
  const addressInput = document.getElementById('place-choice');
  if (addressInput) {
    let numberOfPlaces = 0
    const googleAutocomplete = new google.maps.places.Autocomplete(addressInput)
    const container = document.querySelector(".location-choices-container")
    googleAutocomplete.addListener("place_changed", (e) => {
      const place = googleAutocomplete.getPlace()
      console.log(place)
      const newTitleInput = generateLocationTitleInput(numberOfPlaces, place.name)
      container.insertAdjacentHTML('beforeend', newTitleInput)
      const newAddressInput = generateLocationAddressInput(numberOfPlaces, place.formatted_address)
      container.insertAdjacentHTML('beforeend', newAddressInput)
      numberOfPlaces += 1
      addressInput.value = ""
      addPlaceCard(place, container)
    })
  }
};

export { initAutocomplete };
