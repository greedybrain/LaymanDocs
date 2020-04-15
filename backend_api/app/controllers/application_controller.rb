class ApplicationController < ActionController::API
     include AbstractController::Helpers
     helper_method :current_layman, :current_opp_layman

     def current_layman
          @current_layman = Layman.find(1)
     end

     def current_opp_layman
          @current_layman = Layman.find(2)
     end

     def logged_in? 
          !session[:layman_id].nil?
     end

end
