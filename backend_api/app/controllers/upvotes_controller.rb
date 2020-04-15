class UpvotesController < ApplicationController

     def create 
          if params[:question_id]
               question = Question.find(params[:question_id])
               upvote = question.upvotes.build(count: params[:count])
               if upvote.save 
                    upvote.count + 1
                    binding.pry
                    render json: UpvoteSerializer.new(upvote).serializable_hash
               else
                    render json: { erros: upvote.errors }
               end
          end
     end



end
