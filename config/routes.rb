Rails.application.routes.draw do
  root "projects#index"
  ##wwwwwwwww

  resources :projects do
    resources :tasks
  end
end
