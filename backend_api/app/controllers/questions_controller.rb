class QuestionsController < ApplicationController
     # before_action :logged_in?, only: %i[create update destroy]

     def index
          questions = Question.all
          render json: QuestionSerializer.new(questions).serializable_hash
     end

     def show 
          if params[:layman_id ]
               layman = Layman.find(params[:layman_id])
               question = layman.questions.find(params[:id])
               render json: QuestionSerializer.new(question).serializable_hash
          end
     end

     def scraping
          if authenticate_layman
               @question = current_layman.questions.build
               questions_that_include_url = Question.all.collect{|q| q.url == params[:url]}
               if questions_that_include_url.count > 0 
                    render json: questions_that_include_url
               else
                    @documentation_by_url = Scraper.get_doc_content_by(params[:url])
                    @question.url = params[:url]
                    render json: { message: "The given url returned a document successfully!" }
               end
          else
               render json: { message: "You must be logged in to do that" } 
          end
     end

     def create 
          if question.save
               
               pasted_data = Scraper.get_laymans_paste_info(question.pasted_info)
               if !pasted_data.nil?
                    if info[:body].include?(pasted_data)
                         render json: question
                    else
                         render json: { message: "The information you provided couldn't be found in the documentation." }
                    end
               else
                    render json: { message: "Check the link and try again" }
               end
          else
               render json: { errors: question.errors }
          end
     end

     def update
          if params[:layman_id]
               layman = Layman.find(params[:layman_id])
               question = layman.questions.find(params[:id])
               if authenticate_question(question) 
                    if question.update(question_params)
                         render json: QuestionSerializer.new(question).serializable_hash
                    else
                         render json: { message: "It seems like this post doesn't belong to you" }
                    end
               end
          end
     end

     def destroy 
          # should test against current user
          layman = Layman.find(params[:layman_id])
          question = layman.questions.find(params[:id])
          if authenticate_question(question)
               if question.destroy
                    render json: { message: "Post deleted" }
               else
                    render json: { message: "You must be logged in and the owner of this post to do that" }
               end
          end
     end

     private 
     
     def question_params 
          params.permit(:topic, :url, :pasted_info, :layman_id)
     end

end
