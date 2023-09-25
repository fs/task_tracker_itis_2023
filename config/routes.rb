Rails.application.routes.draw do
  resources :projects
  resources :tasks


  root "projects#index"
end
