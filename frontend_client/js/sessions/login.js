class Login {
     constructor(email, password) {
          this.email = email
          this.password = password
     }
}

loginBtn.addEventListener("click", () => {
     loginForm.style.display = "flex"

     closeBtn.addEventListener("click", () => {
          loginForm.style.display = "none"
     })
})

actualForm.addEventListener("submit", e => {
     e.preventDefault()

     let data = {
          email: emailField.value,
          password: passwordField.value
     }

     let options = {
          method: "POST",
          header: {
               "Content-Type": "application/json",
               "Accept": "application/json"
          },
          body: JSON.stringify(data)
     }
     fetch(`${BASE_URL}${LOGIN}`, options)
          .then(res => res.json())
          .then(console.log)
})