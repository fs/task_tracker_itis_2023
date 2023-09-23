Rails.application.routes.draw do
  root "projects#index"
  resources :projects do
    resources :tasks
  end

  # resources :projects
  # resources :tasks
end
