class PostFetch {

     getUrlData(urlInput) {
          let data = {
               url: urlInput
          }
          let options = {
               method: "POST",
               headers: {
                    "Content-Type": "application/json",
                    "Accept": "application/json"
               },
               body: JSON.stringify(data)
          }
          fetch("http://localhost:3000/validating_url", options)
               .then(res => res.json())
               .then(data => console.log(data))
               .catch(err => err.message)
     }

     getPasteData(pasteData) {
          let data = {
               pasteInfo: pasteData
          }
          let options = {
               method: "POST",
               headers: {
                    "Content-Type": "application/json",
                    "Accept": "application/json"
               },
               body: JSON.stringify(data)
          }
          fetch("http://localhost:3000/validating_info", options)
               .then(res => res.json())
               .then(data => console.log(data))
               .catch(err => err.message)
     }
}