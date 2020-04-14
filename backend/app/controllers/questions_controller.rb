class QuestionsController < ApplicationController

     def index 
          questions = Question.all
          render json: QuestionSerializer.new(questions).serializable_hash
     end

     def show 
          if params[:layman_id]
               layman = Layman.find()
          end
     end

end
