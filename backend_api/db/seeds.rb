# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Layman.create(
     name: Faker::Name.name,
     email: Faker::Internet.email,
     password: "password"
)

20.times do 
     Question.create(
          topic: Faker::Lorem.word,
          url: Faker::Internet.url,
          pasted_info: Faker::Lorem.paragraph(sentence_count: 10),
          layman_id: 1
     )
end

# 10.times do 
#      Elab.create(
#           elaboration: Faker::Lorem.paragraph(sentence_count: 5),
#           question_id: Question.all.sample.id,
#           layman_id: Layman.all.sample.id
#      )
# end

# 7.times do 
#      Reply.create(
#           content: Faker::Lorem.paragraph(sentence_count: 5),
#           elab_id: Elab.all.sample.id,
#           layman_id: Layman.all.sample.id
#      )
# end

# 50.times do 
#      Upvote.create(
#           question_id: Question.all.sample.id,
#           layman_id: Layman.all.sample.id
#      )
#      Upvote.create(
#           elab_id: Elab.all.sample.id,
#           layman_id: Layman.all.sample.id
#      )
#      Downvote.create(
#           question_id: Question.all.sample.id,
#           layman_id: Layman.all.sample.id
#      )
#      Downvote.create(
#           elab_id: Elab.all.sample.id,
#           layman_id: Layman.all.sample.id
#      )
# end

