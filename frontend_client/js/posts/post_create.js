// POST CLASS STARTS HERE
class Post {
  constructor(id, laymanId, topic, url, pasteInfo) {
    this.id = id;
    this.laymanId = laymanId;
    this.topic = topic;
    this.url = url;
    this.pasteInfo = pasteInfo;
    this.constructor.all.push(this);
  }

  static all = [];
}

Post.prototype.createResponseModal = function (post) {
  const resModalDiv = document.createElement("div")
  resModalDiv.classList.add('res-modal-div') //border #333/ width 200px / height 100px
  const modalMsg = document.createElement("p")
  switch (post.message) {
    case "Please enter a valid link":
      modalMsg.textContent = post.message
      break;
    case "We couldn't find that in the documentation. Please check your pasted info.":
      modalMsg.textContent = post.message
      break;
    case "We've found the Doc info you pasted!":
      modalMsg.textContent = post.message
      break;
    default:
      modalMsg.textContent = `We've found: ${post.message}`
      break;
  }

  resModalDiv.appendChild(modalMsg)
  postFormWrapper.appendChild(resModalDiv)
  setTimeout(() => {
    resModalDiv.remove()
  }, 10000)
}

Post.prototype.createPostAsObject = function (post, position) {
  const newPost = new Post(
    post.id,
    post.relationships.layman.data.id,
    post.attributes.topic,
    post.attributes.url,
    post.attributes.pasted_info
  );
  newPost.createCardHeader();
  newPost.createCardBody();
  newPost.createCardFooter();
  if (position === "prepend") {
    allCardsWrapper.prepend(newPost.createCard());
  } else if (position === "append") {
    allCardsWrapper.appendChild(newPost.createCard());
  }
};

Post.prototype.createCardHeader = function () {
  const headerDiv = document.createElement("div");
  headerDiv.classList.add("card-header");
  const topicWrapperDiv = document.createElement("div");
  topicWrapperDiv.classList.add("heading");
  const menuWrapperDiv = document.createElement("div");
  menuWrapperDiv.classList.add("menu");

  const headerTopicH2tag = document.createElement("h2");
  const topicContentAtag = document.createElement("a");
  topicContentAtag.textContent = `${this.topic}`;
  topicContentAtag.setAttribute("href", `${this.url}`);
  topicContentAtag.setAttribute("target", "_blank");
  headerTopicH2tag.appendChild(topicContentAtag);

  topicWrapperDiv.appendChild(headerTopicH2tag);

  for (let x = 0; x < 3; x++) {
    let divDot = document.createElement("div");
    divDot.classList.add("dot");
    menuWrapperDiv.append(divDot);
  }

  headerDiv.append(topicWrapperDiv, menuWrapperDiv);

  return headerDiv;
};

Post.prototype.createCardBody = function () {
  const bodyDiv = document.createElement("div");
  bodyDiv.classList.add("card-body");
  const bodyContentPtag = document.createElement("p");
  const span = document.createElement("span")
  bodyContentPtag.classList.add("body-content");
  bodyContentPtag.textContent = `${this.pasteInfo.slice(0, 100)} ...`;
  bodyDiv.appendChild(bodyContentPtag);

  return bodyDiv;
};

Post.prototype.createCardFooter = function () {
  const cardFooterDiv = document.createElement("div")
  cardFooterDiv.classList.add("footer")
  const postByDiv = document.createElement("div")
  postByDiv.classList.add("post-by")
  postByDiv.innerHTML += `
    posted by:<a href="#" target="_blank"> <span>User: ${this.laymanId}</span></a>
  `
  const elabVotes = document.createElement("div")
  elabVotes.classList.add("elabs-votes")
  const elabs = document.createElement("div")
  elabs.classList.add("elabs")
  elabs.innerHTML += `
    <a href="#" target="_blank">5</a> elabs •
  `
  const votes = document.createElement("div")
  votes.classList.add("votes")
  votes.innerHTML += `
    <div class="upvotes"><a href="#" target="_blank">87</a> &#8679;</div>
    <div class="downvotes"><a href="#" target="_blank">12</a> <span>&#8679;</span></div>
  `
  elabVotes.append(elabs, votes)
  cardFooterDiv.append(postByDiv, elabVotes)

  return cardFooterDiv
}

Post.prototype.createCard = function () {
  const cardDiv = document.createElement("div");
  cardDiv.classList.add("post-card");
  cardDiv.setAttribute("data-post-id", `${this.id}`);
  cardDiv.setAttribute("data-layman-id", `${this.laymanId}`);
  const header = this.createCardHeader();
  const body = this.createCardBody();
  const footer = this.createCardFooter();
  cardDiv.append(header, body, footer);

  return cardDiv;
};
// POST CLASS ENDS HERE