# frozen_string_literal: true

Rails.application.routes.draw do
  resources :imports do
    member do
      post 'import'
      get 'users'
    end
  end

  root to: 'imports#index'
end
