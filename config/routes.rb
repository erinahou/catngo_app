Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cats do
    resources :bookings, only: [:index, :create]
    resources :reviews, only: [:index, :new, :create]
  end
  get '/dashboard', to: 'pages#dashboard'
  patch '/bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  patch '/bookings/:id/decline', to: 'bookings#decline', as: :decline_booking
end
# hello
