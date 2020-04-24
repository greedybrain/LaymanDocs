class SessionsController < ApplicationController

     def logged_in
          layman = Layman.find_by(email: params[:email])
          if layman&.authenticate(params[:password])
               session[:layman_id] = layman.id
               render json: { 
                    status: :created,
                    logged_in: true,
                    layman: LaymanSerializer.new(layman).serializable_hash
               }
          else
               render json: {
                    message: "Incorrect email or password",
                    status: 401 
               }
          end
     end

     def logout 
          session.delete(:layman_id)
          render json: { 
               status: 200,
               logged_out: true,
               message: "You successfully logged out" 
          }
     end

end


