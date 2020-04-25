let pf = new PostFetch();

class PostEvent {
     constructor(urlField, pasteInfoField) {
          this.urlField = urlField
          this.pasteInfoField = pasteInfoField
     }

     handleUrlPasteEvent() {
          this.urlField = document.querySelector("input[name=url]")
          this.urlField.addEventListener('paste', e => {
               setTimeout(() => {
                    pf.getUrlData(this.urlField.value)
               }, 0);
          })
     }
     handlePastedInfoEvent() {
          this.pasteInfoField = document.querySelector("textarea[name=pasted-info]")
          this.pasteInfoField.addEventListener('paste', e => {
               setTimeout(() => {
                    pf.getPasteData(this.pasteInfoField.value)
               }, 0);
          })
     }
}