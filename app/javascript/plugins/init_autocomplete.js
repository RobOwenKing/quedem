import places from 'places.js';

// console.log(place.photos[0].getUrl()
const PLACES = []

const generateLocationTitleInput = (index, value) => {
  return `<input class="form-control string optional hidden-input" type="text" value="${value}" name="hangout[location_choices_attributes][${index}][title]" id="hangout_location_choices_attributes_${index}_title">`
}

const generateLocationAddressInput = (index, value) => {
  return `<input class="form-control string optional hidden-input" type="text" value="${value}" name="hangout[location_choices_attributes][${index}][address]" id="hangout_location_choices_attributes_${index}_address">`
}

const generateLocationRatingInput = (index, value) => {
  return `<input class="form-control string optional hidden-input" type="float" value="${value}" name="hangout[location_choices_attributes][${index}][rating]" id="hangout_location_choices_attributes_${index}_rating">`
}

const generateLocationPhotoInput = (index, value) => {
  return `<input class="form-control string optional hidden-input" type="text" value="${value}" name="hangout[location_choices_attributes][${index}][photo]" id="hangout_location_choices_attributes_${index}_photo">`
}

const resetContainers = () => {
  const cardContainer = document.querySelector(".locations-card-container")
  const inputContainer = document.querySelector(".locations-input-container")
  cardContainer.innerHTML = ""
  inputContainer.innerHTML = ""
  PLACES.forEach((place, index) => {
    const newTitleInput = generateLocationTitleInput(index, place.name)
    inputContainer.insertAdjacentHTML('beforeend', newTitleInput)
    const newAddressInput = generateLocationAddressInput(index, place.formatted_address)
    inputContainer.insertAdjacentHTML('beforeend', newAddressInput)
    const newRatingInput = generateLocationRatingInput(index, place.rating)
    inputContainer.insertAdjacentHTML('beforeend', newRatingInput)
    const newPhotoInput = generateLocationPhotoInput(index, place.photos[0].getUrl())
    inputContainer.insertAdjacentHTML('beforeend', newPhotoInput)

    addPlaceCard(place, cardContainer)
  })
}

const addPlaceCard = (place, container) => {
  const card = `<div class="card-location">
  <div class="location-image" style="background-image: url(${place.photos[0].getUrl()})">
  <div class="dark-overlay">
  </div>
  <p class="rating">${place.rating}</p>
  </div>
  <div class="card-location-infos">
  <h2>${place.name}</h2>
  <h3>${place.vicinity}</h3>
  <i class="delete-location fas fa-times-circle fa-lg"></i>
  </div>
  </div>`
  container.insertAdjacentHTML('beforeend', card)
  const deleteButtons = document.querySelectorAll(".delete-location")
  console.log(deleteButtons)
  deleteButtons[deleteButtons.length - 1].addEventListener("click", () => {
    const index = PLACES.indexOf(place)
    PLACES.splice(index, 1)
    resetContainers()
  })
}

const initAutocomplete = () => {
  const addressInput = document.getElementById('place-choice');
  if (addressInput) {
    let numberOfPlaces = 0
    const googleAutocomplete = new google.maps.places.Autocomplete(addressInput)
    googleAutocomplete.addListener("place_changed", (e) => {
      const place = googleAutocomplete.getPlace()
      console.log(place)
      PLACES.push(place)
      resetContainers()
      addressInput.value = ""
    })
  }
};

export { initAutocomplete };
