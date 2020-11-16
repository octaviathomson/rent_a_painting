Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :paintings do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :update, :destroy]

  get "dashboard", to: "pages#dashboard"

  # resources :pages, only: [:show, :index] as: :dashboard

end
