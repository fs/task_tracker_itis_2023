Rails.application.routes.draw do
  resources :projects do
    resources :tasks
    delete '/task_delete', to: 'tasks#destroy'
    get '/task_show', to: 'tasks#show'
  end

  resources :users, only: %i[new create]
  resource :sessions, only: %i[new create show destroy]

  # delete '/sign_out', to: 'sessions#destroy'

  root "projects#index"
end
