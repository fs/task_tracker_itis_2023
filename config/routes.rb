Rails.application.routes.draw do
  resources :projects do
    resources :tasks
  end

  resources :users, only: %i[new create]
  resource :sessions
end
