class QuestionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :topic, :url, :pasted_info, :elabs
  
  belongs_to :layman
  has_many :elabs, dependent: :destroy
  has_many :laymen, through: :elabs
  # has_many :upvotes
  # has_many :laymen, through: :upvotes
  # has_many :downvotes
  # has_many :laymen, through: :downvotes
end
