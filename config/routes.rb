Rails.application.routes.draw do
  get 'home/about' => "homes#about"
  root 'homes#top'
  
  devise_for :users
  resources :relationships, only: [:create, :destroy]
  resources :users,only: [:show,:index,:edit,:update] do
    get "follower" => "relationships#followerindex"
    get "follow" => "relationships#followindex"
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
     resources :book_comments, only: [:create, :destroy]
  end

end