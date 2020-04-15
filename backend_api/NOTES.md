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

- (GET • all laymen and activity) http://localhost:3000/laymen
- (GET • a laymen) http://localhost:3000/laymen/:id
- (POST • create registration) http://localhost:3000/signup
- (POST • create session) http://localhost:3000/login
- (DELETE • destroy session) http://localhost:3000/logout

## Fetch links Questions √√√√

- (GET • all questions) http://localhost:3000/questions
- (GET • a question) http://localhost:3000/laymen/:id/questions/:id
- (POST • a question) http://localhost:3000/laymen/:id/questions
- (PATCH • a question) http://localhost:3000/laymen/:id/questions/:id
- (DELETE • a question) http://localhost:3000/laymen/:id/questions/:id

## Fetch links Elabs √√√√

- (GET • ALL questions/elabs) http://localhost:3000/questions/:question_id/elabs
- (GET • A questions/elab)http://localhost:3000/questions/:question_id/elabs/:id
- (POST • An elab) http://localhost:3000/questions/:question_id/elabs
- (PATCH • An elab) http://localhost:3000/questions/:question_id/elabs/:id
- (DELETE • An elab) http://localhost:3000/questions/:question_id/elabs/:id

## Fetch links Upvotes √√√√

- (POST • A upvote) http://localhost:3000/questions/:question_id/upvotes
- (POST • A upvote) http://localhost:3000/elabs/:elab_id/upvotes

## Fetch links Downvotes √√√√

- (POST • A downvote) http://localhost:3000/questions/:question_id/downvotes
- (POST • A upvote) http://localhost:3000/elabs/:elab_id/downvotes
