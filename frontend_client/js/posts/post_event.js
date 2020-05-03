const initFetchTo = new Fetch()

// EVENT STARTS HERE
class PostEvent {

     static checkTopicFieldForValue() {
          topicField.addEventListener("focus", e => {
               topicDiv.style.borderBottom = "1px solid #4851f5"
          })
          topicField.addEventListener("blur", e => {
               topicDiv.style.borderBottom = "1px solid #b0b0b0"
          })
          topicField.addEventListener("keyup", e => {
               if (topicField.value.length > 0) {
                    urlField.disabled = false
                    urlField.style.cursor = "pointer"
                    urlDiv.style.borderBottom = "1px solid #4851f5"
                    keyBoard.style.color = "#21fc6e"
                    keyBoard.style.transition = "color .5s ease-in-out"
               } else {
                    urlField.disabled = true
                    urlField.style.cursor = "not-allowed"
                    urlDiv.style.borderBottom = "1px solid #b0b0b0"
                    keyBoard.style.color = "#ff7a7a"
               }

          })
     }

     static checkIfPastedInfoIsTyped() {
          urlField.addEventListener("keypress", e => {
               alert("Please paste in the Url link, do not type it in.")
               setTimeout(() => {
                    urlField.value = ""
               })
          })
          pasteInfoField.addEventListener("keypress", e => {
               alert("Please paste in the Document Info, do not type it in.")
               setTimeout(() => {
                    pasteInfoField.value = ""
               })
          })
     }

     static handleUrlFetchEvent() {
          urlField.addEventListener("paste", e => {
               setTimeout(() => {
                    if (urlField.value.length > 0) {
                         initFetchTo.getUrlData()
                    } else {
                         pasteInfoField.disabled = true
                         pasteInfoField.style.cursor = "not-allowed"
                         pastedInfoDiv.style.borderBottom = "1px solid #b0b0b0"
                         mouse.style.color = "#ff7a7a"
                         mouse.style.transition = "color .5s ease-in-out"
                    }
               }, 0)
          })
     }

     static handlePasteInfoFetchEvent() {
          pasteInfoField.addEventListener("paste", e => {
               setTimeout(() => {
                    if (pasteInfoField.value.length > 0) {
                         initFetchTo.getPasteData()
                    }
               }, 0)
          })
     }

     static handleFormSubmitEvent() {
          form.addEventListener('submit', e => {
               e.preventDefault()
               setTimeout(() => {
                    initFetchTo.submitAPost()
                    form.reset()
               }, 0)
          })

     }

     static handlePostDeleteEvent() {
          setTimeout(() => {
               const postCards = document.querySelectorAll("div.post-card")
               alert(postCards.length)
               postCards.forEach(card => {
                    card.addEventListener("click", e => {
                         initFetchTo.deletePost();
                    })
               })

          }, 5000)
     }
}
// EVENT ENDS HERE 