Rails.application.routes.draw do
  root 'welcome#index'

  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'


  # Admin
  get 'dashboard', to: 'dashboard#index'
  resources :guests, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :rooms, only: [:index, :new, :create, :edit, :update, :destroy]
end
