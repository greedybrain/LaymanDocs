class QuestionsController < ApplicationController

     def index
          if params[:layman_id]
               layman = Layman.find(params[:layman_id])
               questions = layman.questions
          else
               questions = Question.all
          end
          render json: QuestionSerializer.new(questions).serializable_hash
     end

     def show 
          if params[:layman_id]
               layman = Layman.find(params[:layman_id])
               question = layman.questions.find(params[:id])
          else
               question = Question.find(params[:id])
          end
          render json: QuestionSerializer.new(question).serializable_hash
     end

     def create 
          layman = Layman.find(params[:layman_id])
          question = layman.questions.build(question_params)
          if question.save
               render json: QuestionSerializer.new(question).serializable_hash
          end
     end

     def update 
          layman = Layman.find(params[:layman_id])
          question = layman.questions.find(params[:id])
          if question.update(question_params)
               render json: QuestionSerializer.new(question).serializable_hash
          end
     end

     def destroy 
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
