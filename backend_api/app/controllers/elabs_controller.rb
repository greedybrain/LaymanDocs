class ElabsController < ApplicationController

     def index
          if params[:question_id]
               question = Question.find(params[:question_id])
               elabs = question.elabs
          else
               elabs = Elab.all
          end
          render json: ElabSerializer.new(elabs).serializable_hash
     end

     def show 
          if params[:question_id]
               question = Question.find(params[:question_id])
               elab = question.elabs.find(params[:id])
          else
               elab = Elab.find(params[:id])
          end
          render json: ElabSerializer.new(elab).serializable_hash
     end

     def create 
          if params[:question_id]
               question = Question.find(params[:question_id])
               elab = question.elabs.build(elab_params)
               elab.layman_id = current_opp_layman.id # hard coded for now
               if elab.save
                    render json: ElabSerializer.new(elab).serializable_hash
               else
                    render json: { errors: elab.errors }
               end
          end
     end

     def update 
          # hard coded for now
          elab = current_opp_layman.elabs.find(params[:id])
          if elab.update(elab_params)
               render json: ElabSerializer.new(elab).serializable_hash
          else
               render json: { errors: elab.errors }
          end
     end
     
     def destroy
          elab = current_opp_layman.elabs.find(params[:id]) # hard coded for now
          if elab.destroy 
               render json: { message: "Elaboration deleted" }
          else
               render json: { errors: elab.errors }
          end
     end

     private 

     def elab_params
          params.permit(:elaboration, :question_id)
     end

end
