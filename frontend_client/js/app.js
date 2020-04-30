document.addEventListener("DOMContentLoaded", () => {
     app.start()
})

class App {
     start() {
          // ALL TOGETHER
          Fetch.getAllPosts()
          PostEvent.checkTopicFieldForValue()
          PostEvent.checkIfPastedInfoIsTyped()
          PostEvent.handleUrlFetchEvent()
          PostEvent.handlePasteInfoFetchEvent()
          PostEvent.handleFormSubmitEvent()
     }
}

const app = new App()