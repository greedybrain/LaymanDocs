const initFetchTo = new Fetch()

// EVENT STARTS HERE
class PostEvent {
     static handleUrlFetchEvent() {
          urlField.addEventListener("paste", e => {
               setTimeout(() => {
                    initFetchTo.getUrlData()
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