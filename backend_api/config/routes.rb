Rails.application.routes.draw do
  root to: "home#index"

  resource :registration, controller: 'registrations', only: [:create]
  resource :session, controller: 'rails_jwt_auth/sessions', only: [:create, :destroy]

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

end
