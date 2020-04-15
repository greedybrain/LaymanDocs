class ApplicationController < ActionController::API
     include AbstractController::Helpers
     helper_method :current_layman, :vote_system

     def current_layman
          @current_layman = Layman.find(1)
     end

     def logged_in? 
          !session[:layman_id].nil?
     end

     def vote_system(q, el, vote, votes) 
          if params[:question_id]
               # check if upvote is placed on question
               q = Question.find(params[:question_id])
               vote = q.votes.build
               vote.layman_id = current_layman.id 
               if vote.save
                    render json: UpvoteSerializer.new(vote).serializable_hash
               else
                    render json: { erros: vote.errors }
               end
          elsif params[:elab_id]
               # check if upvote is placed on elab
               el = Elab.find(params[:elab_id])
               vote = el.votes.build
               vote.layman_id = current_layman.id 
               vote.question_id = el.question_id
               if vote.save
                    render json: UpvoteSerializer.new(vote).serializable_hash
               else
                    render json: { erros: vote.errors }
               end
          else
               render json: { message: "Something went wrong" }
          end
     end

end
