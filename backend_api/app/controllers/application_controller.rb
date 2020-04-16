class ApplicationController < ActionController::API
     include AbstractController::Helpers
     helper_method :current_layman, :current_opp_layman

     # def current_layman
     #      @current_layman = Layman.find(Layman.all.sample.id)
     # end

     # def current_opp_layman
     #      @current_opp_layman = Layman.find(Layman.all.sample.id)
     # end

     # def logged_in? 
     #      !session[:layman_id].nil?
     # end

     # def authenticate_user 
     #      logged_in? && current_layman
     # end

end
