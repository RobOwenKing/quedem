const form = document.getElementById('new_hangout')
let whatForm
let whereForm
let whenForm
let closeForm

if (form !== null) {
  whatForm = form.querySelector(".form-what");
  whenForm = form.querySelector(".form-when");
  whereForm = form.querySelector(".form-where");
  closeForm = form.querySelector(".form-close-poll");
}

const validateWhat = (nextBtn) => {
  const input = document.querySelector("#hangout_name")
  nextBtn.classList.add("disabled")
  input.addEventListener("keydown", (e) => {
    if (e.target.value.length >= 3){
      nextBtn.classList.remove("disabled")
    } else {
      nextBtn.classList.add("disabled")
    }
  })
}

const validateWhen = (nextBtn) => {
  const container = document.querySelector(".date-cards-container")
  nextBtn.classList.add("disabled")
  container.addEventListener("DOMSubtreeModified", (e) => {

    const cards = container.querySelectorAll(".card-date")
    if(cards.length <= 0) {
      nextBtn.classList.add("disabled")
    } else {
      nextBtn.classList.remove("disabled")
    }
  })
}

const validateWhere = (nextBtn) => {
  const container = document.querySelector(".locations-card-container")
  nextBtn.classList.add("disabled")
  container.addEventListener("DOMSubtreeModified", (e) => {

    const cards = container.querySelectorAll(".card-location")
    if(cards.length <= 0) {
      nextBtn.classList.add("disabled")
    } else {
      nextBtn.classList.remove("disabled")
    }
  })

}

const backButtonForm = () => {
  if (form) {
    const backToWhat = whenForm.querySelector(".back-btn");
    backToWhat.addEventListener('click', jumpBackToWhat)

    const backToWhen = whereForm.querySelector(".back-btn");
    backToWhen.addEventListener('click', jumpBackToWhen)

    const backToWhere = closeForm.querySelector(".back-btn");
    backToWhere.addEventListener('click', jumpBackToWhere)
  }
}

const initHangoutForm = () => {
  console.log(form);
  if (form) {
    const whenBtn = whatForm.querySelector(".next-btn");
    whenBtn.addEventListener('click', jumpToWhen)
    validateWhat(whenBtn)

    const whereBtn = whenForm.querySelector(".next-btn");
    whereBtn.addEventListener('click', jumpToWhere)
    validateWhen(whereBtn)

    const closeBtn = whereForm.querySelector(".next-btn");
    closeBtn.addEventListener('click', jumpToClose)
    validateWhere(closeBtn)
  }
}

const jumpBackToWhat = (e) => {
  e.preventDefault()
  whenForm.classList.remove("form-show");
  whenForm.classList.add("form-hide");

  whatForm.classList.add("form-show");
}

const jumpBackToWhen = (e) => {
  e.preventDefault()
  whereForm.classList.remove("form-show");
  whereForm.classList.add("form-hide");

  whenForm.classList.add("form-show");
}

const jumpBackToWhere = (e) => {
  e.preventDefault()
  closeForm.classList.remove("form-show");
  closeForm.classList.add("form-hide");

  whereForm.classList.add("form-show")
}



const jumpToWhen = (e) => {
  e.preventDefault()
  whatForm.classList.remove("form-show");
  whatForm.classList.add("form-hide");

  whenForm.classList.add("form-show");
}

const jumpToWhere = (e) => {
  e.preventDefault()
  whenForm.classList.remove("form-show");
  whenForm.classList.add("form-hide");

  whereForm.classList.add("form-show");
}

const jumpToClose = (e) => {
  e.preventDefault()
  whereForm.classList.remove("form-show");
  whereForm.classList.add("form-hide");

  closeForm.classList.add("form-show");
}

export { initHangoutForm, backButtonForm }
