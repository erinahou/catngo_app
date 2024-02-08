Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cats do
    resources :bookings
  end

  get '/dashboard', to: 'pages#dashboard'
  patch '/cats/:cat_id/bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  patch '/cats/:cat_id/bookings/:id/decline', to: 'bookings#decline', as: :decline_booking
end
