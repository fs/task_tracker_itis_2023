Rails.application.routes.draw do
  root "projects#index"

  resources :projects do
    resources :tasks, only: [:index, :create, :new, :show]
  end
end
