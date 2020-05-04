const BASE_URL = "http://localhost:3000/";
const ALL_QUESTIONS = "questions";
const VALIDATING_URL = "validating_url";
const VALIDATING_INFO = "validating_info";


const body = document.body;
const responseMsg = document.querySelector("div.response-msg")
const contentWrapper = document.querySelector("div.content-wrapper")
body.appendChild(contentWrapper);
const postFormWrapper = document.querySelector("div.post-form-wrapper")
const allCardsWrapper = document.querySelector("div.all-cards");
contentWrapper.prepend(allCardsWrapper)
const cardBodyP = document.querySelector("div.card-body p")

const form = document.querySelector("form#post-form");
const topicDiv = document.querySelector("div.topic")
const keyBoard = document.querySelector("div.keyboard i")
const urlDiv = document.querySelector("div.url")
const mouse = document.querySelector("div.mouse i")
const pastedInfoDiv = document.querySelector("div.pasted-info")
const topicField = document.querySelector("input[name=topic]");
let urlField = document.querySelector("input[name=url]");
const pasteInfoField = document.querySelector("textarea[name=pasted-info]");