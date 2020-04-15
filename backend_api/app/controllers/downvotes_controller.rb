class DownvotesController < ApplicationController

     def create 
          vote_system(question, elab, downvote, downvotes)
     end

end
