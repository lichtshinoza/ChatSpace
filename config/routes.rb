Rails.application.routes.draw do
  resources :groups, only: :index
  root 'groups#index'
end
