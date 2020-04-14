Rails.application.routes.draw do
  
  resources :laymen

  get "/signup", to: "laymen#create", as: "signup"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
