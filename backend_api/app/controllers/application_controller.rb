class ApplicationController < ActionController::API
     include AbstractController::Helpers
     include ActionController::Cookies
     include ActionController::RequestForgeryProtection

     protect_from_forgery with: :exception

     # skip_before_action :verify_authenticity_token
     
     # helper_method :set_current_layman

     # def authenticate_layman
     #      current_layman && session[:layman_id]
     # end

     # def authenticate_question(question)
     #      question.layman_id == current_layman.id
     # end

     # def authenticate_elab(elab)
     #      elab.layman_id == current_layman.id
     # end

     # def authenticate_reply(reply)
     #      reply.layman_id == current_layman.id
     # end

     # def logged_in? 
     #      !session[:layman_id].nil?
     # end

     # def authenticate_user 
     #      logged_in? && current_layman
     # end

end
