class Question < ApplicationRecord

     belongs_to :layman
     has_many :elabs, dependent: :destroy
     has_many :laymans, through: :elabs
     has_many :upvotes, dependent: :destroy
     has_many :downvotes, dependent: :destroy
     has_many :laymans, through: :votes

end
