# frozen_string_literal: true

Rails.application.routes.draw do
  resources :imports do
    member do
      post 'start_import'
      get 'users'
    end
  end

  root to: 'imports#index'
end
