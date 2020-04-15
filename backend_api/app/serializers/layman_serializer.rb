class LaymanSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :email, :bio, :gender, :questions, :elabs
  
  has_many :questions, dependent: :destroy
  has_many :elabs, dependent: :destroy
  has_many :elabs, through: :questions
  has_many :questions, through: :elabs
end