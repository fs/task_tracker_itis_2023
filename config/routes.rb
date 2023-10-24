# frozen_string_literal: true

Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :tasks, only: %i[index create new show edit update destroy]
  end
end
