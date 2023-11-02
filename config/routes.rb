Rails.application.routes.draw do
  root "projects#index"

  resources :projects do
    resources :tasks
  end

  resources :users, only: %i[new create]
  resource :sessions, only: %i[new create show]

  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  get "register", to: "users#new", as: :register
  post "register", to: "users#create"

  delete 'logout', to: 'sessions#destroy', as: :logout
end
