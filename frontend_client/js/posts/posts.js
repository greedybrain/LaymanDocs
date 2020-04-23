let divWrapper = document.querySelector("div.wrapper");

document.addEventListener("DOMContentLoaded", (e) => {
  getAllPosts();
});

const getAllPosts = () => {
  fetch("http://localhost:3000/questions")
    .then((res) => res.json())
    .then((layman) => console.log(layman));
};

const createPostCard = (layman) => {
  let postCard = document.createElement("div");
  postCard.classList.add("post-card");
  postCard.setAttribute("data-id", `${layman.id}`);
  postCard.append(cardHeader(), cardBody(), cardFooter());

  divWrapper.appendChild(postCard);
};

const cardHeader = () => {
  let cardHeader = document.createElement("div");
  cardHeader.classList.add("card-header");
  let cardHeading = document.createElement("div");
  cardHeading.classList.add("heading");
  let topicH2 = document.createElement("h2");
  topicH2.textContent = "Rails Guides";
  topicH2.classList.add("topic");
  let cardMenu = document.createElement("div");
  cardMenu.classList.add("card-menu");

  cardMenu.innerHTML += `
          <div class="dot"></div>
          <div class="dot"></div>
          <div class="dot"></div>
     `;
  cardHeading.append(topicH2);
  cardHeader.append(cardHeading, cardMenu);

  return cardHeader;
};

const cardBody = () => {
  let cardBody = document.createElement("div");
  cardBody.classList.add("card-body");
  let bodyPara = document.createElement("p");
  bodyPara.textContent = "This is placeholder text...";
  bodyPara.innerHTML += `
          <i class="doc-icon fas fa-file-alt"></i>
     `;
  cardBody.append(bodyPara);

  return cardBody;
};

const cardFooter = () => {
  let cardFooter = document.createElement("div");
  cardFooter.classList.add("card-footer");
  let postDate = document.createElement("div");
  postDate.classList.add("post-date");
  postDate.innerHTML += `
          1 day ago •<span><a href="#"> Naya Willis</a></span>
     `;
  let votesDiv = document.createElement("div");
  votesDiv.classList.add("votes");
  let upVotes = document.createElement("div");
  upVotes.classList.add("upvotes");
  upVotes.innerHTML += `
          <i class="fas fa-arrow-up"></i> ${0}
     `;
  let downVotes = document.createElement("div");
  downVotes.classList.add("downvotes");
  downVotes.innerHTML += `
          <i class="fas fa-arrow-down"></i> ${0}
     `;

  votesDiv.append(upVotes, downVotes);
  cardFooter.append(postDate, votesDiv);

  return cardFooter;
};

`
<div class="post-card">
      <div class="card-header">
        <div class="heading">
          <h2 class="topic">Rails Guides</h2>
        </div>
        <div class="card-menu">
          <div class="dot"></div>
          <div class="dot"></div>
          <div class="dot"></div>
        </div>
      </div>
      <div class="card-body">
        <p>
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsa
          perspiciat...
          <i class="doc-icon fas fa-file-alt"></i>
        </p>
      </div>
      <div class="card-footer">
        <div class="post-date">
          1 day ago •<span><a href="#"> Naya Willis</a></span>
        </div>
        <div class="votes">
          <div class="upvotes"><i class="fas fa-arrow-up"></i> 0</div>
          <div class="downvotes"><i class="fas fa-arrow-down"></i> 0</div>
        </div>
      </div>
</div>
`;
