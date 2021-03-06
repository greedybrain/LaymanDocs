class DownvotesController < ApplicationController

     def create 
           if params[:question_id]
               # check if upvote is placed on question
               question = Question.find(params[:question_id])
               downvote = question.downvotes.build
               if downvote.save
                    render json: DownvoteSerializer.new(downvote).serialized_json
               else
                    render json: { erros: downvote.errors }
               end
          elsif params[:elab_id]
               # check if upvote is placed on elab
               elab = Elab.find(params[:elab_id])
               downvote = elab.downvotes.build
               downvote.question_id = elab.question_id
               if downvote.save
                    render json: DownvoteSerializer.new(downvote).serialized_json
               else
                    render json: { erros: downvote.errors }
               end
          else
               render json: { message: "Something went wrong" }
          end
     end

end
