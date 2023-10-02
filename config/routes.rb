Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/create'
  root "projects#index"

  resources :projects do
    resources :tasks, only: [:index, :create, :new, :show]
  end
end
