Rails.application.routes.draw do
  
  resources :laymen, except: [:new, :create, :update] do 
    resources :questions
  end
  

  # Login and Signup functionality 
  resources :sessions, except: [:create, :destroy]
  post "/signup", to: "laymen#create", as: "signup"
  post "/login", to: "sessions#create", as: "login"
  delete "/logout", to: "sessions#destroy", as: "logout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
