"use-strict"

// TOP LEVEL VARIABLES
const BASEURL = "http://localhost:3000"
const SIGNUP = "/signup"

// first, we want to get the form, and inputs
const form = document.querySelector("form#signup-form")
const formInputs = form.querySelectorAll("input")
const main = document.querySelector('main')
const signup = document.querySelector(".signup-btn");
const nameError = document.querySelector('.name-error')
const emailError = document.querySelector('.email-error')
const pwError = document.querySelector('.pw-error')

// create domcontentloaded listener 
document.addEventListener('DOMContentLoaded', e => {
     signupReveal();
     form.addEventListener('submit', e => {
          e.preventDefault();
          fetchHandlingLaymanSignup();
     })
})

const fetchHandlingLaymanSignup = () => {

     let data = {
          name: formInputs[0].value,
          email: formInputs[1].value,
          password: formInputs[2].value
     }
     let options = {
          method: "POST",
          headers: {
               "Content-Type": "application/json",
               "Accept": "application/json"
          },
          body: JSON.stringify(data)
     }
     fetch(`${BASEURL}${SIGNUP}`, options)
          .then(res => res.json())
          .then(layman => {
               handlingFormErrors(layman)
               console.log(layman)
          })
          .catch(err => err.message)

}

const handlingFormErrors = (layman) => {
     if (Array.from(formInputs)[0].value.length == 0) {
          nameError.textContent = `Name ${layman.errors.name[0]}`
          nameError.style.display = "inline-block"
     }
     if (Array.from(formInputs)[1].value.length == 0) {
          emailError.textContent = `Email ${layman.errors.email[0]}`
          emailError.style.display = "inline-block"
     }
     if (Array.from(formInputs)[2].value.length == 0) {
          pwError.textContent = `Password ${layman.errors.password[0]}`
          pwError.style.display = "inline-block"
     }
     if (Array.from(formInputs)[2].value.length < 8) {
          pwError.textContent = `Password ${layman.errors.password[1]}`
          pwError.style.display = "inline-block"
     }
}


const signupReveal = () => {
     // REVEAL FORM BOX ON CLICK
     signup.addEventListener('click', e => {
          form.style.display = "block"
          form.classList.add('bg-darken-blue')
          main.classList.add('bg-darken')
     })
}