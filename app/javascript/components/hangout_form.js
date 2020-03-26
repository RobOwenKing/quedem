const form = document.getElementById('new_hangout')
const whatForm = form.querySelector(".form-what");
const whenForm = form.querySelector(".form-when");
const whereForm = form.querySelector(".form-where");

const initHangoutForm = () => {
  console.log(form);
  if (form) {

    const whenBtn = whatForm.querySelector("a");
    whenBtn.addEventListener('click', jumpToWhen)

    const whereBtn = whenForm.querySelector("a");
    whereBtn.addEventListener('click', jumpToWhere)

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

export { initHangoutForm }
