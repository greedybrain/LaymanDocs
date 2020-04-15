class DownvoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :layman_id, :elab_id, :question_id 

  belongs_to :layman
  belongs_to :question
  belongs_to :elab
end
