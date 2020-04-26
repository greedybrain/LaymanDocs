// FETCH CLASS STARTS HERE
class Fetch {
     static getAllPosts() {
          fetch(`${BASE_URL}${ALL_QUESTIONS}`)
               .then(res => res.json())
               .then(posts => {
                    posts.data.forEach(post => {
                         if (!(Post.all.includes(post))) {
                              const newPost = new Post(
                                   post.id,
                                   post.relationships.layman.data.id,
                                   post.attributes.topic,
                                   post.attributes.url,
                                   post.attributes.pasteInfo
                              )
                              newPost.createCardHeader()
                              newPost.createCardBody()
                              body.appendChild(newPost.createCard())
                         }
                    })
               })
               .catch(err => err.message)
     }
}

// Should happen upon paste
Fetch.prototype.getUrlData = function () {
     let data = {
          url: urlField.value,
     }
     let options = {
          method: "POST",
          headers: {
               "Content-Type": "application/json",
               "Accept": "application/json"
          },
          body: JSON.stringify(data)
     }

     fetch(`${BASE_URL}${VALIDATING_URL}`, options)
          .then(res => res.json())
          .then(post => console.log(post))
          .catch(err => err.message)
}

// Should happen upon paste
Fetch.prototype.getPasteData = function () {
     let data = {
          pasteInfo: pasteInfoField.value,
     }

     let options = {
          method: "POST",
          headers: {
               "Content-Type": "application/json",
               "Accept": "application/json"
          },
          body: JSON.stringify(data)
     }

     fetch(`${BASE_URL}${VALIDATING_INFO}`, options)
          .then(res => res.json())
          .then(post => console.log(post))
          .catch(err => err.message)
}

Fetch.prototype.submitAPost = function () {
     let data = {
          topic: topicField.value,
          url: urlField.value,
          pasteInfo: pasteInfoField.value,
     }

     let options = {
          method: "POST",
          headers: {
               "Content-Type": "application/json",
               "Accept": "application/json"
          },
          body: JSON.stringify(data)
     }

     fetch(`${BASE_URL}/laymen/1/questions`, options)
          .then(res => res.json())
          .then(post => {
               const newPost = new Post(
                    post.data.id,
                    post.data.relationships.layman.data.id,
                    post.data.attributes.topic,
                    post.data.attributes.url,
                    post.data.attributes.pasteInfo
               )
               newPost.createCardHeader()
               newPost.createCardBody()
               body.appendChild(newPost.createCard())
          })
          .catch(err => err.message)
}
// FETCH CLASS ENDS HERE 