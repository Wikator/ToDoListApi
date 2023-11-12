# frozen_string_literal: true

Rails.application.routes.draw do
  resources :subjects do
    resources :subject_times, only: [:index]
  end

  resources :groups do
    resources :subject_times, only: [:index]
  end

  resources :categories
  resources :tasks
  resources :subject_times, only: %i[index update]
  resources :users, only: [:index]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'my_tasks', to: 'tasks#my_tasks'
  put 'roles/update_role/:user_id', to: 'roles#update_role', as: 'update_role_put'
  patch 'roles/update_role/:user_id', to: 'roles#update_role', as: 'update_role_patch'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'tasks#index'
end
