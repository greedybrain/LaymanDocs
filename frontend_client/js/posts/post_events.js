// Post event handlers 
class PostEvents {
     constructor(urlField, pasteInfoField) {
          this.urlField = document.querySelector("input[name=url]")
          this.pasteInfoField = document.querySelector("input[name=pasted-info]")
     }
     get handleUrlPasteEvent() {
          this.urlField.addEventListener('paste', e => {
               PostFetch.
          })
     }
}