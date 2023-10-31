require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  root "projects#index"
  delete "/logout", to: "sessions#destroy", as: :logout
  
  resources :projects do
    resources :tasks do
      resources :comments, only: %i[create destroy update edit]
    end
  end

  resources :users, only: %i[new create]
  resource :sessions, only: %i[new create show
]
end
