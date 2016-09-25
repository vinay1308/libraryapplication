Rails.application.routes.draw do


  get 'rooms/new'

  get 'bookings/new'

  get 'sessions/new'

  root 'static_pages#home'

  get  '/help',    to: 'static_pages#help'
  get  '/home',    to: 'static_pages#home'
  get  '/about',    to: 'static_pages#about'
  get  '/contact',    to: 'static_pages#contact'
  get  '/signup',    to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get   '/getrooms', to: 'bookings#fetchrooms'
  post   '/getrooms', to:'bookings#showrooms'
  get   '/bookroom', to:'bookings#create'
  post   '/bookroom', to:'bookings#create'
  get '/getHistory', to:'bookings#show'
  post '/ReleaseBooking', to:'bookings#destroy'
  get '/showHome', to:'users#showcurrent'
  post '/ReleaseBooking', to:'bookings#destroy'

  resources :users
resources :rooms
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
