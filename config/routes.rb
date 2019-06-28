# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'landing/index'
  root to: 'landing#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :spots, only: %i[index count]
      get 'spots/count' => 'spots#count'
      resources :tags, only: [:index]
    end
  end
end
