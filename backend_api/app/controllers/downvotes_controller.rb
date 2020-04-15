class DownvotesController < ApplicationController

     def create 
          if params[:question_id]
               question = Question.find(params[:question_id])
               downvote = question.downvotes.build(count: params[:count])
               if downvote.save 
                    downvote.count + 1
                    binding.pry
                    render json: UpvoteSerializer.new(downvote).serializable_hash
               else
                    render json: { erros: downvote.errors }
               end
          end
     end

end
