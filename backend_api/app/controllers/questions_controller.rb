class QuestionsController < ApplicationController

     def index
          questions = Question.all
          render json: QuestionSerializer.new(questions).serializable_hash
     end

     def show 
          question = current_layman.questions.find(params[:id])
          render json: QuestionSerializer.new(question).serializable_hash
     end

     def create 
          question = current_layman.questions.build(question_params)
          if question.save
               render json: QuestionSerializer.new(question).serializable_hash
          end
     end

     def update
          question = current_layman.questions.find(params[:id])
          if question.update(question_params)
               render json: QuestionSerializer.new(question).serializable_hash
          else
               render json: { message: "Seems like this post doesn't belong to you" }
          end
     end

     def destroy 
          question = current_layman.questions.find(params[:id])
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
