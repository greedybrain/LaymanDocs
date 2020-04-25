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
  bodyContentPtag.textContent = this.pasteInfo
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

let form = document.querySelector("form#post-form")
let topicField = document.querySelector("input[name=topic]")
let topicValue = topicField.value
let urlField = document.querySelector("input[name=url]")
let urlValue = urlField.value
let pasteInfoField = document.querySelector("textarea[name=pasted-info]")
let pasteInfoValue = pasteInfoField.value

const newPost = new Post(topicValue, urlValue, pasteInfoValue)
alert(newPost.topicValue)