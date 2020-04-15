class Elab < ApplicationRecord
  belongs_to :question
  belongs_to :layman
  has_many :replies, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
end
