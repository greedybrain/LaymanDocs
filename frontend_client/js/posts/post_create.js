class Post {
  constructor(topic, url, pasteInfo) {
    this.topic = topic
    this.url = url
    this.pasteInfo = pasteInfo
  }
  createHeader() {
    // top level parent elements 
    const header = document.createElement('div')
    const topicWrapper = document.createElement('div')
    const menuWrapper = document.createElement('div')

    const headerTopic = document.createElement('h2')
    const topicContent = document.createElement('a')
    topicContent.textContent = this.topic
    topicContent.setAttribute('href', `${this.url}`)
    headerTopic.appendChild(topicContent)
  }
}