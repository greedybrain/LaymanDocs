class UpvoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :elab_id, :question_id 

  belongs_to :question
  belongs_to :elab
end
