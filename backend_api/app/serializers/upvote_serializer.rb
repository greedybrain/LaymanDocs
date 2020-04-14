class UpvoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :count 

  belongs_to :question
  belongs_to :layman
  belongs_to :elab
end
