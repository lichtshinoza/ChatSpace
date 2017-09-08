Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: :index
  root 'groups#index'
  get 'users/:id' => 'users#show'
end
