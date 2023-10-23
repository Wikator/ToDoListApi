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

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'my_tasks', to: 'tasks#my_tasks'
  put 'roles/update_role'
  patch 'roles/update_role'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
