class QuestionsController < ApplicationController
     # before_action :logged_in?, only: %i[create update destroy]

     def index
          questions = Question.all
          render json: QuestionSerializer.new(questions).serializable_hash
     end

     def show 
          if params[:layman_id ]
               layman = Layman.find(params[:layman_id])
               question = layman.questions.find(params[:id])
               render json: QuestionSerializer.new(question).serializable_hash
          end
     end

     def create 
          question = current_layman.questions.build(question_params)
          if question.save
               render json: QuestionSerializer.new(question).serializable_hash
          end
     end

     def update
          if params[:layman_id]
               layman = Layman.find(params[:layman_id])
               question = layman.questions.find(params[:id])
               # if question.layman_id == current_layman.id 
                    if question.update(question_params)
                         render json: QuestionSerializer.new(question).serializable_hash
                    else
                         render json: { message: "It seems like this post doesn't belong to you" }
                    end
               # end
          end
     end

     def destroy 
          # should test against current user
          layman = Layman.find(params[:layman_id])
          question = layman.questions.find(params[:id])
          if question.destroy
               render json: { message: "Post deleted" }
          else
               render json: { message: "You must be logged in and the owner of this post to do that" }
          end
     end

     private 
     
     def question_params 
          params.permit(:topic, :url, :pasted_info)
     end

end
