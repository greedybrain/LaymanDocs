// loginBtn.addEventListener("click", () => {
//      loginForm.style.display = "flex"

//      closeBtn.addEventListener("click", () => {
//           loginForm.style.display = "none"
//      })
// })

// actualForm.addEventListener("submit", e => {
//      e.preventDefault()

//      let data = {
//           email: emailField.value,
//           password: passwordField.value
//      }

//      let options = {
//           method: "POST",
//           headers: {
//                "Content-Type": "application/json",
//                "Accept": "application/json"
//           },
//           body: JSON.stringify(data)
//      }
//      fetch(`${BASE_URL}${LOGIN}`, options)
//           .then(res => res.json())
//           .then(json => {
//                localStorage.setItem("token", json.jwt_token)
//                localStorage.setItem("layman_id", json.layman.data.id)
//                console.log(json)
//                debugger
//           })

//      actualForm.reset()
//      loginForm.style.display = "none"
// })