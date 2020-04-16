// TOP LEVEL VARIABLES
const BASEURL = "http://localhost:3000"
const SIGNUP = "/signup"

// first, we want to get the form, and inputs
let form = document.querySelector("form#signup-form")
let formInputs = document.querySelectorAll("input")

// create domcontentloaded listener 
document.addEventListener('DOMContentLoaded', e => {
     // add a listener to the form and prevent it's default behavior
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
          .then(layman => console.log(layman))
}