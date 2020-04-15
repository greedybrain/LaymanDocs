Rails.application.routes.draw do
  
  resources :laymen, except: [:new, :edit, :create, :update] do 
    resources :questions, except: [:new, :edit] # All other CRUD under laymen
  end

  resources :questions, only: [:index, :show] do 
    resources :elabs # All other CRUD under questions
    resources :upvotes, only: [:create]
    resources :downvotes, only: [:create]
  end

  resources :elabs, only: [] do 
    resources :upvotes, only: [:create]
    resources :downvotes, only: [:create]
  end


  # Signup, Login, and Logout routing
  resources :sessions, except: [:create, :destroy]
  post "/signup", to: "laymen#create", as: "signup"
  post "/login", to: "sessions#create", as: "login"
  delete "/logout", to: "sessions#destroy", as: "logout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# ****** NOTE ******
# Only the elbaorator can delete their elaborations DIRECTLY 
# When a laymen deletes a question/post, then all elaborations go with it
