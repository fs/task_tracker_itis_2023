# frozen_string_literal: true

Rails.application.routes.draw do
  root "projects#index"

  resources :projects do
    resources :tasks, only: %i[index create new show edit update destroy]
  end

  get "/login", to: "sessions#new", as: "login"
  get "/register", to: "users#new", as: "register"
  resources :sessions, only: %i[new create destroy]
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :users, only: %i[new create]
  resource :sessions, only: %i[new create show]
end
