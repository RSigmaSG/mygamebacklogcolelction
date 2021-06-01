Rails.application.routes.draw do
  resources :plays
  root 'application#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/search' => 'games#search'
  resources :posts
  resources :users do
    resources :posts, only: [:index]
  end
  resources :games do
    resources :users, only: [:show]
  end
  
  resources :welcome
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
