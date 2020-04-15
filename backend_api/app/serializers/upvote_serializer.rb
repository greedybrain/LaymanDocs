class UpvoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :layman_id, :elab_id 

  belongs_to :layman
  belongs_to :question
  belongs_to :elab
end
