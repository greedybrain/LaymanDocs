class LaymenController < ApplicationController

     # this renders all activity (questions and elabs)
     def index 
          laymen = Layman.all
          # render json: laymen
          render json: LaymanSerializer.new(laymen).serialized_json
     end

     def show 
          # make sure to assign div a data-id
          layman = Layman.find(params[:id])
          render json: LaymanSerializer.new(layman).serialized_json 
     end

     def create 
          # send signup request through form in html 
          layman = Layman.new(layman_params)
          if layman.save 
               session[:layman_id] = layman.id
               render json: LaymanSerializer.new(layman).serialized_json
          else
               render json: { errors: layman.errors }
          end
     end

     private 

     def layman_params
          params.permit(:name, :email, :password, :bio, :gender)
     end

end