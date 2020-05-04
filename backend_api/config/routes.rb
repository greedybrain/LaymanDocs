Rails.application.routes.draw do
  
  # resources :laymen, only: %i[index show destroy] do 
  # end
  resources :questions, except: %i[new edit] # All other CRUD under laymen

  resources :questions, only: %i[index show] do 
    resources :elabs # All other CRUD under questions
    resources :upvotes, only: [:create]
    resources :downvotes, only: [:create]
  end

  resources :elabs, only: [] do 
    resources :upvotes, only: [:create]
    resources :downvotes, only: [:create]
    resources :replies, only: %i[create update destroy]
  end

  post '/validating_url', to: "questions#validate_url"
  post '/validating_info', to: "questions#validate_pasted_info"

  # Signup, Login, and Logout routing
  # post "/signup", to: "laymen#create"
  # post "/login", to: "auths#create"
  # delete "/logout", to: "sessions#logout"

  get "/auto_login", to: "auths#auto_login"
  get "/user_authorized", to: "auths#user_authorized"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# ****** NOTE ******
# Only the elbaorator can delete their elaborations DIRECTLY 
# When a layman deletes a question/post, then all elaborations go with it
