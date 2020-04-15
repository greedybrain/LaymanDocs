class ElabSerializer
  include FastJsonapi::ObjectSerializer
  attributes :elaboration, :replies

  belongs_to :question
  belongs_to :layman
end
