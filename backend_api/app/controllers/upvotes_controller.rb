class UpvotesController < ApplicationController

     def create 
          if params[:question_id]
               # check if upvote is placed on question
               question = Question.find(params[:question_id])
               upvote = question.upvotes.build
               if upvote.save
                    render json: UpvoteSerializer.new(upvote).serialized_json
               else
                    render json: { erros: upvote.errors }
               end
          elsif params[:elab_id]
               # check if upvote is placed on elab
               elab = Elab.find(params[:elab_id])
               upvote = elab.upvotes.build
               upvote.question_id = elab.question_id
               if upvote.save
                    render json: UpvoteSerializer.new(upvote).serialized_json
               else
                    render json: { erros: upvote.errors }
               end
          else
               render json: { message: "Something went wrong" }
          end
     end

end
