class RegistrationsController < RailsJwtAuth::RegistrationsController

     def create 
          user = RailsJwtAuth.new(user_params)
          if user.save 
               binding.pry
               render json: UserSerializer.new(user).serialized_json
          end
     end

     def user_params
          params.permit(:name, :email, :password)
     end

end
