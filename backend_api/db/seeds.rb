# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

poster = Layman.create(
     name: "Naya Willis",
     email: "willisnaya@gmail.com",
     bio: "Just a guy who likes to code",
     password: "password"
)

responder = Layman.create(
     name: "Marissa Joseph",
     email: "marissajoseph@gmail.com",
     bio: "Just a woman who knows everything",
     password: "password"
)

15.times do 
     Question.create(
          topic: "Topic: #{Faker::Lorem.word}",
          url: Faker::Internet.url,
          pasted_info: "#{poster.name.capitalize} posted #{Faker::Lorem.paragraph(sentence_count: 10)}",
          layman_id: poster.id
     )
end

20.times do 
     Elab.create(
          elaboration: "#{responder.name.capitalize} responded #{Faker::Lorem.paragraph(sentence_count: 5)}",
          question_id: Question.all.sample.id,
          layman_id: responder.id 
     )
end