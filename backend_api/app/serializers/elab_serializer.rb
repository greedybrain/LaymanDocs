class ElabSerializer
  include FastJsonapi::ObjectSerializer
  attributes :elaboration, :replies, :upvotes, :downvotes

  belongs_to :question
  has_many :replies, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
end
