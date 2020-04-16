class Question < ApplicationRecord

     validates :url, :topic, :pasted_info, presence: true
     validates :pasted_info, uniqueness: true, acceptance: { message: "We've found related posts" }


     belongs_to :layman
     has_many :elabs, dependent: :destroy
     has_many :upvotes, dependent: :destroy
     has_many :downvotes, dependent: :destroy

end
