class ApplicationController < ActionController::API
     include AbstractController::Helpers
     helper_method :current_layman

     def current_layman
          @current_layman = Layman.find(1)
     end

     def logged_in? 
          !session[:layman_id].nil?
     end

end
