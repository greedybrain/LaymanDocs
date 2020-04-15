class QuestionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :topic, :url, :pasted_info, :elabs, :upvotes, :downvotes
  
  belongs_to :layman
  has_many :elabs, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
end
