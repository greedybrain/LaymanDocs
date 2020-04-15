class ElabSerializer
  include FastJsonapi::ObjectSerializer
  attributes :elaboration, :replies

  has_many :replies
  has_many :laymen, through: :replies
  has_many :upvotes, dependent: :destroy
  has_many :laymen, through: :upvotes
  has_many :downvotes
  has_many :laymen, through: :downvotes
end
