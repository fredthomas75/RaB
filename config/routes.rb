Rails.application.routes.draw do
  devise_for :users
  root to: 'boats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :boats, except: [:index] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]
end
