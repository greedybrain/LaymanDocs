class Question < ApplicationRecord

     # validates :topic, presence: true
     # validates :url, presence: true
     # validates :pasted_info, presence: true

     belongs_to :layman
     has_many :elabs, dependent: :destroy
     has_many :laymen, through: :elabs
     # has_many :upvotes, dependent: :destroy
     # has_many :downvotes, dependent: :destroy
     # has_many :laymans, through: :votes

end
