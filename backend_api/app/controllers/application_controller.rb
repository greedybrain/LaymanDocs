class ApplicationController < ActionController::API
     include AbstractController::Helpers
     helper_method :current_layman, :current_opp_layman, :authenticate_elab, :authenticate_question, :authenticate_layman, :authenticate_reply

     def current_layman
          @current_layman = Layman.find(Layman.all.sample.id)
     end

     def random_layman
          @current_opp_layman = Layman.find(Layman.all.sample.id)
     end

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
