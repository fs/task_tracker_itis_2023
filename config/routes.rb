Rails.application.routes.draw do
  root "projects#index"
  
  resources :tasks

  resources :projects do 
    resources :tasks
  end
end
