class Downvote < ApplicationRecord
  belongs_to :question
  belongs_to :layman
  belongs_to :elab
end
