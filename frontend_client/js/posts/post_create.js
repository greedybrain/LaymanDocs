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
  bodyContentPtag.classList.add("body-content");
  bodyContentPtag.textContent = `${this.pasteInfo}`;
  bodyDiv.appendChild(bodyContentPtag);

  return bodyDiv;
};

Post.prototype.createCard = function () {
  const cardDiv = document.createElement("div");
  cardDiv.classList.add("post-card");
  cardDiv.setAttribute("data-post-id", `${this.id}`);
  cardDiv.setAttribute("data-layman-id", `${this.laymanId}`);
  const header = this.createCardHeader();
  const body = this.createCardBody();
  cardDiv.append(header, body);

  return cardDiv;
};
// POST CLASS ENDS HERE