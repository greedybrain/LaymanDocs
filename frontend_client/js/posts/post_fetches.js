class PostFetch {
     constructor(urlField, pasteInfoField, data = null, options = null) {
          this.urlField = document.querySelector("input[name=url]")
          this.pasteInfoField = document.querySelector("input[name=pasted-info]")
          this.data = data
          this.options = options
     }
     get handleUrlPasteEvent() {
          this.urlField.addEventListener('paste', e => {

          })
     }
}