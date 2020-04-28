class SessionsController < ApplicationController

     def create 
          layman = Layman.find_by(email: params[:email])
          if layman&.authenticate(params[:password])  
               this_token = LaymanSerializer.new(layman).serialized_json
               render json: {
                    token: Auth.encode_token(this_token)
               }
          else
               render json: { status: 401 }
          end
     end

     def logout 
          session.delete(:layman_id)
          render json: { 
               status: 200,
               token: nil,
               message: "Logged out successfully" 
          }
     end

end


