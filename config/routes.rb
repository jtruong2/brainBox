Rails.application.routes.draw do
  root to: "dashboard#index"

  get '/', to: "dashboard#index"

  resources :users, only: [:new, :create, :show]

end
