const withThisPost = new Post();

// FETCH CLASS STARTS HERE
class Fetch extends Post {

  static getAllPosts = () => {
    fetch(`${BASE_URL}${ALL_QUESTIONS}`)
      .then((res) => res.json())
      .then((posts) => {
        posts.data.forEach((post) => {
          withThisPost.createPostAsObject(post, "append");
        });
      })
      .catch(console.log);
  }

  static authCheck = () => {
    const token = localStorage.getItem("token")
    if (token) {
      fetch("http://localhost:3000/auto_login", {
          headers: {
            "Authorization": `Bearer ${token}`
          }
        })
        .then(res => res.json())
        .then(data => {
          console.log(data)
        })
    }
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
    .then((post) => console.log(post))
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
    .then((post) => console.log(post))
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
      "Authorization": `Bearer ${token}`,
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