class Layman < ApplicationRecord
     has_secure_password

     has_many :questions, dependent: :destroy
     has_many :elabs, through: :questions
     has_many :replies, through: :elabs
     has_many :upvotes, dependent: :destroy
     has_many :downvotes, dependent: :destroy
end
