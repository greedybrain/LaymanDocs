class Post {
  constructor(topic, url, pasteInfo) {
    this.topic = topic
    this.url = url
    this.pasteInfo = pasteInfo
  }
  createHeader() {
    // top level parent elements 
    const headerDiv = document.createElement('div')
    headerDiv.classList.add("card-header")
    const topicWrapperDiv = document.createElement('div')
    topicWrapperDiv.classList.add("heading")
    const menuWrapperDiv = document.createElement('div')
    menuWrapperDiv.classList.add("menu")

    const headerTopicH2tag = document.createElement('h2')
    const topicContentAtag = document.createElement('a')
    topicContentAtag.textContent = this.topic
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
}

let new_post = new Post("Rails", "http://www.google.com", "Nice work Johnny")

new_post.createHeader()