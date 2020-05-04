class Downvote < ApplicationRecord
  belongs_to :question
  belongs_to :elab
end
