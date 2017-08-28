Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home' => 'home#index'
  post 'home' => 'home#post'

  resources :tweets do
    resources :comments, only:[:create]
  end
  resources :users, only:[:show]
end
