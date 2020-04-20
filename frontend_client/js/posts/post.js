let postForm = document.querySelector("form#post-form")
let topicField = document.querySelector('input[name="topic"]')
let urlField = document.querySelector('input[name="url"]')
let pastedInfoField = document.querySelector('textarea[name="pasted-info"]')

postForm.addEventListener('submit', e => {
     e.preventDefault();

     fetchCreateAndPersistPost();
})

urlField.addEventListener('paste', e => {
     // alert("working")
     setTimeout(function () {
          fetchUrlValidator();
     }, 0)
})

// if (urlField.value.length > 0) {
pastedInfoField.addEventListener('paste', e => {
     setTimeout(function () {
          fetchPastedInfoValidator();
     }, 0)
})
// }

const fetchUrlValidator = () => {
     let data = {
          url: urlField.value
     }

     let options = {
          method: "POST",
          headers: {
               "Content-Type": "application/json",
               "Accept": "application/json"
          },
          body: JSON.stringify(data)
     }

     fetch("http://localhost:3000/validating_url", options)
          .then(res => res.json())
          .then(data => console.log(data))
          .catch(err => err.message)
}

const fetchPastedInfoValidator = () => {
     let data = {
          pasted_info: pastedInfoField.value
     }

     let options = {
          method: "POST",
          headers: {
               "Content-Type": "application/json",
               "Accept": "application/json"
          },
          body: JSON.stringify(data)
     }

     fetch("http://localhost:3000/validating_info", options)
          .then(res => res.json())
          .then(data => console.log(data))
          .catch(err => err.message)
}

const fetchCreateAndPersistPost = () => {
     let data = {
          topic: topicField.value,
          url: urlField.value,
          pasted_info: pastedInfoField.value
     }

     let options = {
          method: "POST",
          headers: {
               "Content-Type": "application/json",
               "Accept": "application/json"
          },
          body: JSON.stringify(data)
     }

     fetch("http://localhost:3000/laymen/1/questions", options)
          .then(res => res.json())
          .then(data => console.log(data))
          .catch(err => err.message)
}