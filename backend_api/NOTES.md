## Who is your User?

- The user is your typical programmer and other individuals who do a lot of
  research

## What are their pain points?

- Sometimes documentation in various fields can be a little overwhelming because
  of the jargon and other terminologies it may use. There should be a way for
  documentation to made easier to understand.

## How do they use our solution to overcome this problem?

- With LaymanDoc, users contribute their elaborations on pieces of
  documentation(if not the whole document) of many different topics(primary
  focus Programmers/Developers). Elaborations will be upvoted, similar to a
  StackOverflow fashion to determine the validity of certain elaborations. The
  more upvotes an elaboration has, the most likely that that elaboration on that
  piece of documentation is much more readable/understandable.

====================================

## BACKEND

## Models

- Layman √√√√
- Question √√√√
- Elab √√√√
- Reply √√√√
- Upvote √√√√
- Downvote √√√√

## The particulars/behaviors/associations(SCHEMA)

- A user/layman has a name, reputation, bio and a profile containing that
  information √√√√
- A question has a topic, url, pasted_info, time created √√√√
- A elab has text, time created √√√√
- A reply has text, time created
- An upvote is an integer √√√√
- A downvote is an integer √√√√

## A Layman > √√√√

- has_many :questions, dependent: :destroy √√√√
- has_many :elabs, through: :questions √√√√
- has_many :elabs, dependent: :destroy √√√√
- has_many :questions, through: :elabs √√√√

## A Question > √√√√

- belongs to a layman √√√√
- has many elabs √√√√
- has many laymans through elabs √√√√
- has many upvotes √√√√
- has many downvotes √√√√
- has many laymans through votes √√√√

## An Elab > √√√√

- belongs to a question √√√√
- belongs to a layman √√√√
- has many replies
- has many Upvotes √√√√
- has many Downvotes √√√√

## A Reply >

- belongs to a elab
- belongs to a layman

## A Upvote > √√√√

- belongs to a question √√√√
- belongs to an elab √√√√

## A Downvote > √√√√

- belongs to a question √√√√
- belongs to an elab √√√√

====================================================================

## FRONT END

## Fetch links Layman registration/sessions √√√√

- (GET • all laymen and activity) [http://localhost:3000/laymen] √
- (GET • a laymen) [http://localhost:3000/laymen/:id] √
- (POST • create registration) [http://localhost:3000/signup] √
- (POST • create session) [http://localhost:3000/login] √
- (DELETE • destroy session) [http://localhost:3000/logout] √

## Fetch links Questions √√√√

- (GET • all questions) [http://localhost:3000/questions] √
- (GET • a question) [http://localhost:3000/laymen/:id/questions/:id] √
- (POST • a question) [http://localhost:3000/laymen/:id/questions] √
- (PATCH/PUT • a question) [http://localhost:3000/laymen/:id/questions/:id] √
- (DELETE • a question) [http://localhost:3000/laymen/:id/questions/:id] √

## Fetch links Elabs √√√√

- (GET • ALL
  questions/elabs)[http://localhost:3000/questions/:question_id/elabs] √
- (GET • A
  questions/elab)[http://localhost:3000/questions/:question_id/elabs/:id] √
- (POST • An elab) [http://localhost:3000/questions/:question_id/elabs] √
- (PATCH/PUT • An elab) [http://localhost:3000/questions/:question_id/elabs/:id]
  √
- (DELETE • An elab) [http://localhost:3000/questions/:question_id/elabs/:id] √

## Fetch links Upvotes √√√√

- (POST • A upvote) [http://localhost:3000/questions/:question_id/upvotes] √
- (POST • A upvote) [http://localhost:3000/elabs/:elab_id/upvotes] √

## Fetch links Downvotes √√√√

- (POST • A question downvote) √
  [http://localhost:3000/questions/:question_id/downvotes] √
- (POST • An elab downvote) [http://localhost:3000/elabs/:elab_id/downvotes] √

## Fetch links Replies √√√√

- (POST • A reply) [http://localhost:3000/elabs/:elab_id/replies] √
- (PATCH/PUT • A reply) [http://localhost:3000/elabs/:elab_id/replies/:id] √
- (DELETE • A reply) [http://localhost:3000/elabs/:elab_id/replies/:id] √

## Fetch url scrape path

- (POST • Scrape url info) [http://localhost:3000/validating_url]
- (POST • Scrape info results) [http://localhost:3000/validating_info]

=======================================

## Scraping time

```ruby
require "nokogiri"
require "open-uri"

def filterText(arr)
 toFilter = /[!@#$%^&*\(\)\\\/?\[\]<>,\.`~\{\}+=\-_œ∑´®†¥¨ˆøπ“‘«æ…¬˚∆˙©ƒ∂ßåΩ≈ç√∫˜µ≤≥÷≠–ºª•¶§∞¢£™¡"':;|]/
 arr.join(' ').gsub(/[^[:ascii:]]/, " ").gsub(toFilter, ' ').gsub(" ", "")
end

def doesInfoProvidedByThisLink(url)
 textCollection = Nokogiri::HTML(open(url)).css("*").collect do |el|  el.text
 end.join('').split(' ')
 return filterText(textCollection)
end

def usersPieceOfDocumentation(users_post)
 post = users_post.split(' ')
 return filterText(post)
end

multi_line_post = ""

doesInfoProvidedByThisLink("https://guides.rubyonrails.org/getting_started.html").include?(usersPieceOfDocumentation(multi_line_post))
```

Scraping Approach

What I want done?

1. When a user pastes a webpage link in the url field, I want to check if it
   aleady exists as a value for another questions url key.

```ruby
# Question.all.select_all{|q| q.url == params[:url]}

#or

Question.find_or_create_by(url: params[:url])

# if found (presented) =>

<Question id: 1, url: "www.google.com", topic: "dogs", pasted_info: "Loere fde magogn gougaojgw bal blah">

# if not found (created) =>

<Question id: 1, url: "www.google.com", topic: nil, pasted_info: nil >
# Then assign topic and pasted_info after/later

```

Get all Laymen/js

```js
fetch(`${BASEURL}/laymen`)
  .then((res) => {
    return res.json();
  })
  .then((layman) => {
    layman.data.forEach((layman) => {
      // debugger
      let p = document.createElement("p");
      layman.attributes.questions.forEach((question) => {
        p.textContent = question.url;
      });
      document.body.append(p);
    });
  })
  .catch((err) => console.log(err.message));
```

```js
// REACT/RAILS API AUTH
```
