class QuestionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :topic, :url, :pasted_info, :elabs, :upvotes
  
  belongs_to :layman
  has_many :elabs, dependent: :destroy
  has_many :laymen, through: :elabs
  has_many :upvotes, dependent: :destroy
  has_many :laymen, through: :upvotes
  has_many :downvotes, dependent: :destroy
  has_many :laymen, through: :downvotes
end
