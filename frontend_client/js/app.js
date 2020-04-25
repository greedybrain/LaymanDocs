let topicField = document.querySelector("input[name=topic]")
let urlField = document.querySelector("input[name=url]")
let pasteInfoField = document.querySelector("textarea[name=pasted-info]")

document.addEventListener("DOMContentLoaded", () => {
     let newPost = new Post(
          topicField.value,
          urlField.value,
          pasteInfoField.value
     )

     const newPostEvent = new PostEvent()
     newPostEvent.handleUrlPasteEvent()
     newPostEvent.handlePastedInfoEvent()

     newPost.createCardHeader()
     newPost.createCardBody()
     document.body.appendChild(newPost.createCard())
})