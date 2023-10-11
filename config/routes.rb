Rails.application.routes.draw do
  root "projects#index"

  resources :projects do
    resources :tasks
  end

  #resources :users, only: %i[new create]
  #resource :sessions, only: %i[new create show]
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

end
