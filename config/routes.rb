Rails.application.routes.draw do
  root "projects#index"

  resources :projects do
    resources :tasks
  end

  get "/login", to: "sessions#new", as: "login"
  get "/register", to: "users#new", as: "register"

  resources :users, only: %i[new create]
  resource :sessions, only: %i[new create show]

end
