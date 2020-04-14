class QuestionsController < ApplicationController

     def index 
          questions = Question.all
          render json: QuestionSerializer.new(questions).serializable_hash
     end

     def show 
          if params[:layman_id]
               layman = Layman.find(params[:layman_id])
               question = layman.questions.find(params[:id])
               render json: QuestionSerializer.new(question).serializable_hash
          else
               question = Question.find(params[:id])
               render json: QuestionSerializer.new(question).serializable_hash
          end
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
          # layman = Layman.find(params[:layman_id])
          # question = layman.questions.find(params[:id])
          question = Question.find(params[:id])
          if question.destroy
               render json: { message: "Post deleted" }
          end
     end

     private 
     
     def question_params 
          params.permit(:topic, :url, :pasted_info)
     end

end
