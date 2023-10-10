# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  put 'roles/update_role'
  patch 'roles/update_role'
  resources :tasks
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/my_tasks', to: 'tasks#my_tasks'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
