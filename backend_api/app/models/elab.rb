class Elab < ApplicationRecord
  belongs_to :question
  belongs_to :layman

  has_many :replies
  has_many :laymen, through: :replies
  has_many :upvotes, dependent: :destroy
  has_many :laymen, through: :upvotes
  has_many :downvotes
  has_many :laymen, through: :downvotes
end
