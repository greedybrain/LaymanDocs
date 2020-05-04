class LaymanSerializer
  # include FastJsonapi::ObjectSerializer

  # attributes :name, :email, :questions, :elabs
  
  # has_many :questions, dependent: :destroy
  # has_many :elabs, through: :questions
  # has_many :replies, through: :elabs
  # has_many :upvotes, dependent: :destroy
  # has_many :downvotes, dependent: :destroy
end
