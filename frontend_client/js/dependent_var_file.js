const BASE_URL = "http://localhost:3000/";
const ALL_QUESTIONS = "questions";
const SIGNUP = "signup";
const LOGIN = "login";
const LOGOUT = "logout";
const VALIDATING_URL = "validating_url";
const VALIDATING_INFO = "validating_info";

const loginBtn = document.querySelector("button.login-btn")
const loginForm = document.querySelector("div.login-form")
const actualForm = loginForm.querySelector("form")
const closeBtn = document.querySelector("span.close")
const emailField = document.querySelector("input[name=email]")
const passwordField = document.querySelector("input[name=password]")

const body = document.body;
const allCardsWrapper = document.querySelector("div.all-cards");
body.appendChild(allCardsWrapper);
const form = document.querySelector("form#post-form");
const topicField = document.querySelector("input[name=topic]");
let urlField = document.querySelector("input[name=url]");
const pasteInfoField = document.querySelector("textarea[name=pasted-info]");