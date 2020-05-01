const withThisPost = new Post();

// FETCH CLASS STARTS HERE
class Fetch extends Post {

  static getAllPosts = () => {
    // const token = localStorage.getItem("token")
    fetch(`${BASE_URL}${ALL_QUESTIONS}`)
      .then((res) => res.json())
      .then((posts) => {
        posts.data.forEach((post) => {
          withThisPost.createPostAsObject(post, "append");
        });
      })
      .catch(console.log);
  }
}

// Should happen upon paste
Fetch.prototype.getUrlData = function () {
  const data = {
    url: urlField.value,
  };
  const options = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json",
    },
    body: JSON.stringify(data),
  };

  fetch(`${BASE_URL}${VALIDATING_URL}`, options)
    .then((res) => res.json())
    .then((post) => {
      if (post.message !== "Please enter a valid link") {
        withThisPost.createResponseModal(post)
        mouse.style.color = "#21fc6e"
        mouse.style.transition = "color .5s ease-in-out"
        pasteInfoField.disabled = false
        pasteInfoField.style.cursor = "pointer"
        pastedInfoDiv.style.borderBottom = "1px solid #4851f5"
      } else {
        withThisPost.createResponseModal(post)
      }
    })
    .catch(console.log);
};

// Should happen upon paste
Fetch.prototype.getPasteData = function () {
  const data = {
    pasteInfo: pasteInfoField.value,
  };

  const options = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json",
    },
    body: JSON.stringify(data),
  };

  fetch(`${BASE_URL}${VALIDATING_INFO}`, options)
    .then((res) => res.json())
    .then((post) => {
      if (post.message !== "Please enter a valid link") {
        withThisPost.createResponseModal(post)
        mouse.style.color = "#21fc6e"
        mouse.style.transition = "color .5s ease-in-out"
        pasteInfoField.disabled = false
        pasteInfoField.style.cursor = "pointer"
        pastedInfoDiv.style.borderBottom = "1px solid #4851f5"
      } else {
        withThisPost.createResponseModal(post)
      }
    })
    .catch(console.log);
};

Fetch.prototype.submitAPost = function () {
  const token = localStorage.getItem("token")

  const data = {
    topic: topicField.value,
    url: urlField.value,
    pasteInfo: pasteInfoField.value,
  };

  const options = {
    method: "POST",
    headers: {
      // "Authorization": `Bearer ${token}`,
      "Content-Type": "application/json",
      Accept: "application/json",
    },
    body: JSON.stringify(data),
  };

  fetch(`${BASE_URL}/laymen/${this.laymanId}/questions`, options)
    .then((res) => res.json())
    .then((post) => {
      withThisPost.createPostAsObject(post.data, "prepend");
    })
    .catch(console.log);
};
// FETCH CLASS ENDS HERE