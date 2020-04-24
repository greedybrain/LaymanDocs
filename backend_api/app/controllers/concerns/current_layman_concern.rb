module CurrentLaymanConcern
     extend ActiveSupport::Concern 

     included do 
          before_action :set_current_layman 
     end

     def set_current_layman
          @current_user = Layman.find(session[:layman_id]) if session[:layman_id]
     end
end