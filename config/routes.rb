Rails.application.routes.draw do
  resources :projects do
    resources :tasks
    delete '/task_delete', to: 'tasks#destroy'
    get '/task_show', to: 'tasks#show'
  end

  root "projects#index"
end
