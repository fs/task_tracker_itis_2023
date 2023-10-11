Rails.application.routes.draw do
  devise_for :users
  resources :assignments
  #get 'home/index'
  get 'home/about'
  # root 'home#index'
  root 'projects#index'

  resources :projects do
    resources :assignments
  end
end
