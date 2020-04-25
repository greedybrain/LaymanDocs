// class PostFetch {

//      // static getAllPosts() {
//      //      fetch("http://localhost:3000/questions")
//      //           .then(res => res.json())
//      //           .then(question => {
//      //                question.data.attributes.forEach(attr => {
//      //                     let newPost = new Post(attr.topic, attr.url, attr.pasteInfo)
//      //                     newPost.createCardHeader()
//      //                     console.log(newPost.createCardBody())
//      //                     document.body.appendChild(newPost.createCard())
//      //                })
//      //           })
//      //           .catch(err => err.message)
//      // }
// // 
//      getUrlData(urlInput) {
//           let data = {
//                url: urlInput
//           }
//           let options = {
//                method: "POST",
//                headers: {
//                     "Content-Type": "application/json",
//                     "Accept": "application/json"
//                },
//                body: JSON.stringify(data)
//           }
//           fetch("http://localhost:3000/validating_url", options)
//                .then(res => res.json())
//                .then(data => console.log(data))
//                .catch(err => err.message)
//      }

//      getPasteData(pasteData) {
//           let data = {
//                pasteInfo: pasteData
//           }
//           let options = {
//                method: "POST",
//                headers: {
//                     "Content-Type": "application/json",
//                     "Accept": "application/json"
//                },
//                body: JSON.stringify(data)
//           }
//           fetch("http://localhost:3000/validating_info", options)
//                .then(res => res.json())
//                .then(data => console.log(data))
//                .catch(err => err.message)
//      }

//      getOverallPost(topic, url, pasteInfo) {
//           let data = {
//                topic: topic,
//                url: url,
//                pasteInfo: pasteInfo
//           }
//           let options = {
//                method: "POST",
//                headers: {
//                     "Content-Type": "application/json",
//                     "Accept": "application/json"
//                },
//                body: JSON.stringify(data)
//           }
//           fetch("http://localhost:3000/laymen/1/questions", options)
//                .then(res => res.json())
//                .then(data => console.log(data))
//                .catch(err => err.message)
//      }
// }