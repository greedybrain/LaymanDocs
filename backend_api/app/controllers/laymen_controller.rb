class LaymenController < ApplicationController

     # this renders all activity (questions and elabs)
     # def index 
     #      laymen = Layman.all.order("created_at DESC")
     #      render json: LaymanSerializer.new(laymen).serialized_json
     # end

     # def show 
     #      # make sure to assign div a data-id
     #      layman = Layman.find(params[:id])
     #      render json: LaymanSerializer.new(layman).serialized_json
     # end

     # def create 
     #      # send signup request through form in html 
     #      layman = Layman.new(layman_params)
     #      if layman.save
     #           payload = LaymanSerializer.new(layman).serialized_json
     #           token = encode_token(payload)
     #           render json: {
     #                layman: layman,
     #                jwt_token: token,
     #                message: "Signup Successful!" 
     #           }
     #      else
     #           render json: {  
     #                errors: { message: "A user already exists with that email"},
     #                status: 500
     #           }
     #      end
     # end

     # private 

     # def layman_params
     #      params.permit(:name, :email, :password)
     # end

end
