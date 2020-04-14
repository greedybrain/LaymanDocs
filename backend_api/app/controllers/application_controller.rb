class ApplicationController < ActionController::API
     include AbstractController::Helpers
     helper_method :current_layman, :authenticate_question

     def current_layman
          @current_layman ||= Layman.find(session[:layman_id])
     end

     # def authenticate_question(q)
     #      @current_layman.questions.include?(q)
     # end

end
