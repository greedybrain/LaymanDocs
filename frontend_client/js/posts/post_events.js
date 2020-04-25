let pf = new PostFetch();

class PostEvents {
     constructor(urlField, pasteInfoField) {
          this.urlField = urlField
          this.pasteInfoField = pasteInfoField
     }

     handleUrlPasteEvent() {
          this.urlField = document.querySelector("input[name=url]")

          this.urlField.addEventListener('paste', e => {
               pf.getUrlData(this.urlField.value)
          })
     }
     handlePastedInfoEvent() {
          this.pasteInfoField = document.querySelector("input[name=pasted-info]")
          this.pasteInfoField.addEventListener('paste', e => {
               pf.getPasteData(this.pasteInfoField.value)
          })
     }
}