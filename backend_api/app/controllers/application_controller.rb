class ApplicationController < ActionController::API # or < ActionController::Base
     # require_relative "../../lib/tasks/auth.rb"

     include AbstractController::Helpers
     
     # before_action :require_login

     # def encode_token(payload)
     #      JWT.encode(payload, ENV['JWT_TOKEN_SECRET'])
     # end

     # def auth_header
     #      request.headers['Authorization']
     #      # get authorization key from headers hash
     # end

     # def decoded_token
     #      if auth_header
     #           token = auth_header.split(' ')[1]
     #           begin
     #                JWT.decode(token, ENV['JWT_TOKEN_SECRET'], true, algorithm: ENV['JWT_ALGORITHM'])
     #           rescue JWT::DecodeError
     #                []
     #           end
     #      end
     # end

     # def session_layman
     #      decoded_hash = decoded_token
     #      if !decoded_hash.nil?
     #           # puts decoded_hash.class
     #           user_id = decoded_hash[0]['user_id']
     #           @user = User.find(user_id)
     #      else
     #           nil 
     #      end
     # end

     # def logged_in?
     #      !!session_layman
     # end

     # def require_login
     #      render json: {message: 'Please Login'}, status: :unauthorized unless logged_in?
     # end

end
