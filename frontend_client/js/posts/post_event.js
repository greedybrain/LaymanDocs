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
               alert("Please paste in the url link. Do not type it in.")
               setTimeout(() => {
                    urlField.value = ""
               })
          })
     }

     static handleUrlFetchEvent() {
          urlField.addEventListener("paste", e => {
               const errMessage = "That link is invalid, please enter a valid link"
               setTimeout(() => {
                    if (urlField.value.length > 0) {
                         pasteInfoField.disabled = false
                         pasteInfoField.style.cursor = "pointer"
                         pastedInfoDiv.style.borderBottom = "1px solid #4851f5"
                         if (initFetchTo.getUrlData().message !== errMessage) {
                              mouse.style.color = "#21fc6e"
                              mouse.style.transition = "color .5s ease-in-out"
                         }
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
                    initFetchTo.getPasteData()
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
}
// EVENT ENDS HERE 