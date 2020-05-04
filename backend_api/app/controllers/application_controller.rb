class ApplicationController < ActionController::API # or < ActionController::Base
     include AbstractController::Helpers
     include ActionController::MimeResponds

     respond_to :json

end
