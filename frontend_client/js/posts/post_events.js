let pf = new PostFetch();

class PostEvent {
     constructor() {
          this.urlField = document.querySelector("input[name=url]")
          this.pasteInfoField = document.querySelector("textarea[name=pasted-info]")
     }

     handleUrlPasteEvent() {
          this.urlField.addEventListener('paste', e => {
               setTimeout(() => {
                    pf.getUrlData(this.urlField.value)
               }, 0);
          })
     }
     handlePastedInfoEvent() {
          this.pasteInfoField.addEventListener('paste', e => {
               setTimeout(() => {
                    pf.getPasteData(this.pasteInfoField.value)
               }, 0);
          })
     }
}