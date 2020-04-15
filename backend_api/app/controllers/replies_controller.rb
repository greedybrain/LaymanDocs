class RepliesController < ApplicationController

     def create
          if params[:elab_id]
               elab = Elab.find(params[:elab_id])
               reply = elab.replies.build(reply_params)
               reply.layman_id = current_layman.id
               if reply.save 
                    render json: ReplySerializer.new(reply).serializable_hash
               end
          else
               render json: { message: "Something went wrong" }
          end
     end

     def update 
          if params[:elab_id]
               elab = Elab.find(params[:elab_id])
               reply = elab.replies.find(params[:id])

          end
     end

     def destroy 
     end

     private 

     def reply_params
          params.permit(:content, :elab_id, :layman_id)
     end

end
