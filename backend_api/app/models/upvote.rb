class Upvote < ApplicationRecord
  belongs_to :layman
  belongs_to :question
  belongs_to :elab
end

# Continuously subtract downvotes from upvotes to get total
