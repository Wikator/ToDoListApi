# frozen_string_literal: true

Rails.application.routes.draw do
  resources :groups
  resources :subjects
  resources :categories
  resources :tasks
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/my_tasks', to: 'tasks#my_tasks'
  get '/subject_times/time', to: 'subject_times#time'
  put '/subject_times', to: 'subject_times#update'
  patch '/subject_times', to: 'subject_times#update'
  put 'roles/update_role'
  patch 'roles/update_role'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
