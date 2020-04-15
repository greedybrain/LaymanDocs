class SessionsController < ApplicationController

     def create
          layman = Layman.find_by(email: params[:email])
          if layman&.authenticate(params[:password])
               session[:layman_id] = layman.id
               render json: LaymanSerializer.new(layman).serializable_hash
          else
               render json: { message: "Incorrect email or password" }
          end
     end

     def destroy 
          session.delete(:layman_id)
          render json: { message: "You successfully logged out" }
     end

end


