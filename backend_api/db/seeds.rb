# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

layman = Layman.create(
     name: "Naya Willis",
     email: "willisnaya@gmail.com",
     bio: "Just a guy who likes to code",
     gender: "male",
     password: "password"
)

10.times do 
     Question.create(
          topic: "Topic: #{Faker::Lorem.word}",
          url: Faker::Internet.url,
          pasted_info: Faker::Lorem.paragraph(sentence_count: 5),
          layman_id: layman.id
     )
end