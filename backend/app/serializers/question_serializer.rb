class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :topic, :url, :pasted_info
  belongs_to :layman
end
