class API::V1::LaymenController < ApplicationController

     # this renders all activity (questions and elabs)
     def index 
          laymen = Layman.all
          render json: laymen, except: [:created_at, :updated_at]
     end

     # this renders a particular layman/laywoman
     def show 
          layman = Layman.find(params[:id])
          # make sure to assign div a data-id

          render json: layman, except: [:created_at, :updated_at]
     end

end
