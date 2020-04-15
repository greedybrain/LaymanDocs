class ReplySerializer
  include FastJsonapi::ObjectSerializer
  attributes :content

  belongs_to :elab
  belongs_to :layman
end
