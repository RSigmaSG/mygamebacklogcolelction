Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :games
  root 'application#hello'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  
  resources :welcome
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
