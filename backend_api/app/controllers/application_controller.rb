class ApplicationController < ActionController::API # or < ActionController::Base
     include RailsJwtAuth::AuthenticableHelper
     include AbstractController::Helpers

end
