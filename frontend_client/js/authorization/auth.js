// const token = localStorage.getItem("token")
// const laymanId = localStorage.getItem("layman_id")

// const autoLogin = () => {
//      if (token) {
//           return fetch("http://localhost:3000/auto_login", {
//                     headers: {
//                          "Authorization": `Bearer ${token}`
//                     }
//                })
//                .then(res => res.json())
//                .then(data => {
//                     console.log(data)
//                })
//      }
// }

// const currentUser = () => {
//      return token && laymanId ? {
//           laymanId
//      } : "Not logged in"
// }