class ElabSerializer
  include FastJsonapi::ObjectSerializer
  attributes :elaboration

  belongs_to :question
  belongs_to :layman
end
