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

const initHangoutForm = () => {
  console.log(form);
  if (form) {

    const whenBtn = whatForm.querySelector("a");
    whenBtn.addEventListener('click', jumpToWhen)

    const whereBtn = whenForm.querySelector("a");
    whereBtn.addEventListener('click', jumpToWhere)

    const closeBtn = whereForm.querySelector("a");
    closeBtn.addEventListener('click', jumpToClose)
  }
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

export { initHangoutForm }
