class AuthsController < ApplicationController
     # skip_before_action :require_login, only: [:create, :auto_login]

     # def create 
     #      layman = Layman.find_by(email: params[:email])
     #      if layman&.authenticate(params[:password])  
     #           payload = LaymanSerializer.new(layman).serializable_hash
     #           token = encode_token(payload)
     #           render json: {
     #                layman: LaymanSerializer.new(layman).serializable_hash,
     #                jwt_token: token,
     #                message: "Welcome back, #{layman.name}",
     #                status: 200
     #           }
     #      else
     #           render json: { 
     #                errors: { message: "Incorrect email or passowrd, try again" },
     #                status: 401
     #           }
     #      end
     # end

     # def auto_login 
     #      if session_layman
     #           render json: session_layman
     #      else
     #           render json: { errors: "No User Logged In" }
     #      end
     # end

     # def user_authorized 
     #      render json: { message: "You've been authorized" }
     # end

     # def logout 
     #      # session.delete(:layman_id)
     #      render json: { 
     #           jwt_token: nil,
     #           message: "Logged out successfully" ,
     #           status: 200
     #      }
     # end

end
