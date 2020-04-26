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
               if authenticate_reply(reply)
                    if reply.update(reply_params)
                         render json: ReplySerializer.new(reply).serializable_hash
                    else
                         render json: { message: "It seems like this post doesn't belong to you" }
                    end
               end
          end
     end

     def destroy 
          if params[:elab_id]
               elab = Elab.find(params[:elab_id])
               reply = elab.replies.find(params[:id])
               if authenticate_reply(reply)
                    reply.destroy
                    render json: { message: "Reply deleted" }
               else
                    render json: { message: "It seems like this reply doesn't belong to you" }
               end
          end
     end

     private 

     def reply_params
          params.permit(:content, :elab_id)
     end

end
