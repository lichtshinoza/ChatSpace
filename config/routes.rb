Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: :show
  resources :groups, only: :index
end
