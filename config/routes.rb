Rails.application.routes.draw do
  devise_for :users
  root to: 'trips#index'

  resources :trips do
    resources :date_ranges, only: :create
    resources :activities, only: :create
  end
  resources :activities, only: [] do
    resources :breakdowns, only: [:new, :create]
  end
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
