Rails.application.routes.draw do
  root to: "homepage#index"

  get '/', to: "homepage#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]

  namespace 'admin' do
    resources :dashboard, only: [:index]
    resources :categories, only: [:new, :create, :destroy]
    resources :images, only: [:new, :create, :show, :destroy]
  end


end
