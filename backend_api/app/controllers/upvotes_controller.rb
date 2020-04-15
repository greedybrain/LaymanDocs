class UpvotesController < ApplicationController

     def create 
          vote_system(question, elab, upvote, upvotes)
     end

end
