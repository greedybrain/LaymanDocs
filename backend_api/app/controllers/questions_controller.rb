class QuestionsController < ApplicationController
     # before_action :logged_in?, only: %i[create update destroy]

     def index
          questions = Question.all
          render json: QuestionSerializer.new(questions).serializable_hash
     end

     def show 
          if params[:layman_id ]
               layman = Layman.find(params[:layman_id])
               @question = layman.questions.find(params[:id])
               render json: QuestionSerializer.new(@question).serializable_hash
          end
     end

     def validate_url
          # if authenticate_layman
               @@question = Layman.all.sample.questions.build
               questions_that_include_url = Question.all.select{|q| q.url == params[:url]}
               if questions_that_include_url.count > 0 
                    render json: {
                         message: "Related Searches",
                         posts: QuestionSerializer.new(questions_that_include_url).serializable_hash
                    }
               else
                    @@documentation_by_url = Question.get_doc_content_by(params[:url])
                    @@question.url = params[:url]
                    render json: { 
                         message: @@documentation_by_url[:title]
                    }
               end
          # else
          #      render json: { message: "You must be logged in to do that" } 
          # end
     end

     def validate_pasted_info 
          # if authenticate_layman
               questions_that_include_pasted_info = Question.all.select{|q| q.pasted_info == params[:pasted_info]}
               if questions_that_include_pasted_info.count > 0
                    render json: {
                         message: "Found related searches",
                         post: QuestionSerializer.new(questions_that_include_pasted_info).serializable_hash
                    }
               else
                    pasted_data = Question.get_laymans_paste_info(params[:pasted_info])
                    binding.pry
                    if !pasted_data.nil?
                         if @@documentation_by_url[:body].include?(pasted_data)
                              @@question.pasted_info = params[:pasted_info]
                              render json: { 
                                   message: "We found that in the documentation!",
                                   doc: @@documentation_by_url[:body]
                              }
                         else
                              render json: { 
                                   message: "We couldn't find that in the documentation. Please check your pasted info.",
                                   doc: @@documentation_by_url[:body]
                              }
                         end
                    end  
               end
          # end
     end

     def create
          @@question.topic = params[:topic]
          if @@question.save
               render json: QuestionSerializer.new(@@question).serializable_hash
          else
               render json: { errors: @@question.errors }
          end
     end

     def update
          if params[:layman_id]
               layman = Layman.find(params[:layman_id])
               question = layman.questions.find(params[:id])
               # if authenticate_question(question) 
                    if question.update(question_params)
                         render json: QuestionSerializer.new(question).serializable_hash
                    else
                         render json: { message: "It seems like this post doesn't belong to you" }
                    end
               # end
          end
     end

     def destroy 
          # should test against current user
          layman = Layman.find(params[:layman_id])
          question = layman.questions.find(params[:id])
          # if authenticate_question(question)
               if question.destroy
                    render json: { message: "Post deleted" }
               else
                    render json: { message: "You must be logged in and the owner of this post to do that" }
               end
          # end
     end

     private 
     
     def question_params 
          params.permit(:topic, :url, :pasted_info)
     end

end
