Rails.application.routes.draw do
  get 'home/index'
  root "home#index"

  resources :projects do
    resources :tasks
  end
end
