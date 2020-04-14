class QuestionsController < ApplicationController
     before_action :set_questions_layman, except: [:index]
     before_action :set_laymans_question, except: [:index]

     def index
          questions = Question.all
          render json: QuestionSerializer.new(questions).serializable_hash
     end

     def show 
          if params[:layman_id]
               render json: QuestionSerializer.new(@question).serializable_hash
          else
               @question = Question.find(params[:id])
               render json: QuestionSerializer.new(@question).serializable_hash
          end
     end

     def create 
          @question = @layman.questions.build(question_params)
          if @question.save
               render json: QuestionSerializer.new(@question).serializable_hash
          end
     end

     def update 
          if @question.update(question_params)
               render json: QuestionSerializer.new(@question).serializable_hash
          end
     end

     def destroy
          if @question.destroy
               render json: { message: "Post deleted" }
          end
     end

     private 
     
     def question_params 
          params.permit(:topic, :url, :pasted_info)
     end

     def set_questions_layman
          @layman = Layman.find(params[:layman_id])
     end

     def set_laymans_question 
          @question = @layman.questions.find(params[:id])
     end

end
