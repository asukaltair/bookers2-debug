Rails.application.routes.draw do


  devise_for :users

  root 'homes#top'
  get 'home/about' => "homes#about"

  resources :users, only: [:show,:index,:edit,:update]

  post 'follow/:id' => 'relationships#create', as: 'follow'
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
  get 'users/:id/follows' => 'relationships#follows', as: 'follows'
  get 'users/:id/followers' => 'relationships#followers', as: 'followers'

  get 'search' => 'search#search'
  get 'search/users' => 'search#users'
  get 'search/books' => 'search#books'

  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :post_comments, only: [:create, :destroy]
  end


end