Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  get 'landing/index'
  root to: "landing#index"
end
