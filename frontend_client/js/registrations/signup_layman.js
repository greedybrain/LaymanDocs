const main = document.querySelector('main')
const signup = document.querySelector(".signup-btn");

// REVEAL FORM BOX ON CLICK
signup.addEventListener('click', e => {
     form.style.display = "block"
     form.classList.add('bg-darken-blue')
     main.classList.add('bg-darken')
})