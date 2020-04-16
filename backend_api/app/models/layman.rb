class Layman < ApplicationRecord
     has_secure_password

     validates :name, :email, presence: true
     validates :email, uniqueness: true, 
     format: { 
          with: /\A(\S+)@(.+)\.(\S+)\z/,
          message: "Please enter a valid email"
     }
     validates :password, presenc: true, length: { minimum: 8 }

     has_many :questions, dependent: :destroy
     has_many :elabs, through: :questions
     has_many :replies, through: :elabs
     has_many :upvotes, dependent: :destroy
     has_many :downvotes, dependent: :destroy
end
