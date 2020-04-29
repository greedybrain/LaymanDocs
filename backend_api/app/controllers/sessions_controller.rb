class SessionsController < ApplicationController

     # def create 
     #      layman = Layman.find_by(email: params[:email])
     #      if layman&.authenticate(params[:password])  
     #           this_token = LaymanSerializer.new(layman).serializable_hash
     #           this_token_user = this_token
     #           render json: {
     #                message: "Login Successful",
     #                token: Auth.encode_token(this_token),
     #                layman: this_token_user,
     #                status: 200
     #           }
     #      else
     #           render json: { 
     #                errors: { message: "Incorrect email or passowrd, try again" },
     #                status: 401
     #           }
     #      end
     # end

end


