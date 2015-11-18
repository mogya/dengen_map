Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  get 'landing/index'
  root to: "landing#index"

  resources :links
  resources :spots
  namespace :spot_info do
    resources :business_hours
    resources :dayoffs
    resources :powersupplies
    resources :smokes
  end
  namespace :tag do
    resources :categories
    resources :others
    resources :wifis
  end
end
