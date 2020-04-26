const BASE_URL = "http://localhost:3000/"
const ALL_QUESTIONS = "questions"
const SIGNUP = "signup"
const LOGIN = "login"
const LOGOUT = "logout"
const VALIDATING_URL = "validating_url"
const VALIDATING_INFO = "validating_info"

const body = document.body
const form = document.querySelector("form#post-form")
const topicField = document.querySelector("input[name=topic]")
const topicValue = topicField.value
const urlField = document.querySelector("input[name=url]")
const urlValue = urlField.value
const pasteInfoField = document.querySelector("textarea[name=pasted-info]")
const pasteInfoValue = pasteInfoField.value

// POST CLASS STARTS HERE 
class Post {
  constructor(topic, url, pasteInfo) {
    this.topic = topic
    this.url = url
    this.pasteInfo = pasteInfo
  }
}

Post.prototype.createCardHeader = function () {
  const headerDiv = document.createElement('div')
  headerDiv.classList.add("card-header")
  const topicWrapperDiv = document.createElement('div')
  topicWrapperDiv.classList.add("heading")
  const menuWrapperDiv = document.createElement('div')
  menuWrapperDiv.classList.add("menu")

  const headerTopicH2tag = document.createElement('h2')
  const topicContentAtag = document.createElement('a')
  topicContentAtag.textContent = `${this.topic}`
  topicContentAtag.setAttribute('href', `${this.url}`)
  headerTopicH2tag.appendChild(topicContentAtag)

  topicWrapperDiv.appendChild(headerTopicH2tag)

  for (let x = 0; x < 3; x++) {
    let divDot = document.createElement('div')
    divDot.classList.add("dot")
    menuWrapperDiv.append(divDot)
  }

  headerDiv.append(topicWrapperDiv, menuWrapperDiv)

  return headerDiv
}

Post.prototype.createCardBody = function () {
  const bodyDiv = document.createElement('div')
  bodyDiv.classList.add("card-body")
  const bodyContentPtag = document.createElement('p')
  bodyContentPtag.classList.add("body-content")
  bodyContentPtag.textContent = `${this.pasteInfo}`
  bodyDiv.appendChild(bodyContentPtag)

  return bodyDiv
}

Post.prototype.createCard = function () {
  const cardDiv = document.createElement('div')
  cardDiv.classList.add('post-card')
  const header = this.createCardHeader()
  const body = this.createCardBody()
  cardDiv.append(header, body)

  return cardDiv
}
// POST CLASS ENDS HERE 

// FETCH CLASS STARTS HERE 
class Fetch {
  static getAllPosts() {
    fetch(`${BASE_URL}${ALL_QUESTIONS}`)
      .then(res => res.json())
      .then(posts => {
        posts.data.forEach(post => {
          const newPost = new Post(
            post.attributes.topic,
            post.attributes.url,
            post.attributes.pasteInfo
          )
          newPost.createCardHeader()
          newPost.createCardBody()
          const createdCard = newPost.createCard()
          body.appendChild(createdCard)
        })
      })
      .catch(err => err.message)
  }

  // Should happen upon paste
  static getUrlData() {
    let data = {
      url: urlValue,
    }

    let options = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(data)
    }
    fetch(`${BASE_URL}${VALIDATING_URL}`, options)
      .then(res => res.json())
      .then(post => console.log(post))
      .catch(err => err.message)
  }
}
// FETCH CLASS ENDS HERE 

// EVENT STARTS HERE 
class Event {

}
// EVENT ENDS HERE 

// Should happen upon submit 
// const newPost = new Post(topicValue, urlValue, pasteInfoValue)

// Fetch.getAllPosts()
Fetch.getUrlData()