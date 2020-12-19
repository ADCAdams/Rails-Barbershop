Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' =>  'customers#new'
  delete '/logout' => 'sessions#destroy'

  resources :appointments
  resources :customers
  resources :barbers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
