class ApplicationController < ActionController::API
     include AbstractController::Helpers
     helper_method :current_layman

     def current_layman
          @current_layman ||= Layman.find(session[:layman_id])
     end

end
