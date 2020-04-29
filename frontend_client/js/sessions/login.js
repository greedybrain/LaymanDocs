class Login {
     constructor(email, password, token = null) {
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
          headers: {
               "Content-Type": "application/json",
               "Accept": "application/json"
          },
          body: JSON.stringify(data)
     }
     fetch(`${BASE_URL}${LOGIN}`, options)
          .then(res => res.json())
          .then(data => {
               const msg = document.createElement("h2")
               if (data.token) {
                    msg.textContent = `${data.message}`
                    msg.style.color = "#42f560"
               } else {
                    msg.textContent = `${data.errors.message}`
                    msg.style.color = "#f55142"
               }
               allCardsWrapper.prepend(msg)
               localStorage.setItem("token", data.token)
          })

     actualForm.reset()
     loginForm.style.display = "none"
})