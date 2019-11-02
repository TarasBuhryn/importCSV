# frozen_string_literal: true

Rails.application.routes.draw do
  resources :imports do
    resources :users do
      collection { post :import }
    end
  end

  root to: 'imports#index'
end
