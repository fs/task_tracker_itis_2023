Rails.application.routes.draw do
  root "projects#index"

  resources :projects do
    resources :tasks, only: [:index, :create, :new, :show, :edit, :update, :destroy]
  end
end
