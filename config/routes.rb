Rails.application.routes.draw do
  resources :books
  
  resources :categories

  root :to => 'books#index'

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
end
