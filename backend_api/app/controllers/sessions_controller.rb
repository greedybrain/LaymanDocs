class SessionsController < ApplicationController

     def create
          layman = Layman.find_by(email: params[:email])
          if layman&.authenticate(params[:password])
               session[:layman_id] = layman.id
               render json: LaymanSerializer.new(layman).serializable_hash
          end
     end

     def destroy 
          session.delete(:layman_id)
     end

end


