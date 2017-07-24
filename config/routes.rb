Rails.application.routes.draw do
  use_doorkeeper
  root to: "pages#index"

  resources :sessions, only: [:new, :create]
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show] do
    resources :ideas
  end

  namespace 'admin' do
    resources :dashboard, only: [:index]
    resources :categories, only: [:new, :create, :destroy]
    resources :images, only: [:new, :create, :show, :destroy]
  end


end
