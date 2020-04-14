class Layman < ApplicationRecord
     has_secure_password

     has_many :questions
     # has_many :elabs, through: :questions
     # has_many :questions, through: :elabs
end
