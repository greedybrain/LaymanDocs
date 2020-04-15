class RepliesController < ApplicationController

     def create
          if params[:elab_id]
               elab = Elab.find(params[:elab_id])
               reply = elab.replies.build(reply_params)
               if reply.save 
                    render json: R
               end
          else
               render json: { message: "Something went wrong" }
          end
     end

     def update 
          if params[:elab_id]
               elab = Elab.find(params[:elab_id])
               
          end
     end

     def destroy 
     end

end
