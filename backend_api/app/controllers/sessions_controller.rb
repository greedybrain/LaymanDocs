class SessionsController < ApplicationController

     include CurrentLaymanConcern

     def create 
          layman = Layman.find_by(email: params[:email])
          if layman&.authenticate(params[:password])
            session[:layman_id] = layman.id 
            render json: {
                 status: :created,
                 logged_in: true,
                 layman: LaymanSerializer.new(layman).serializable_hash 
            }   
          else
               render json: { status: 401 }
          end
     end
     
     def logged_in
          if @current_layman
               session[:layman_id] = layman.id
               render json: {
                    logged_in: true,
                    layman: LaymanSerializer.new(@current_layman).serializable_hash
               }
          else
               render json: {
                    status: 401, 
                    message: "Incorrect email or password"
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


