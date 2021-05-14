Rails.application.routes.draw do
  root 'application#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :posts
  resources :users
  resources :games
  
  resources :welcome
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
