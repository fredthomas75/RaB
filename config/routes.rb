Rails.application.routes.draw do
  devise_for :users
  root to: 'boats#index'

  patch 'bookings/:id/confirm_summary', to: 'bookings#confirm_summary', as: :confirm_summary
  patch 'bookings/:id/accept', to: 'bookings#accept', as: :accept
  patch 'bookings/:id/refuse', to: 'bookings#refuse', as: :refuse
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :boats, except: [:index] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]
end
