Rails.application.routes.draw do
  resources :user_tickets
  resources :tickets
  resources :events
  resources :places
  devise_for :users, controllers: { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :tickets
  root :to => 'sessions#index'

  get '/cart', to: 'cart#index', ad: :shopping_cart

  post '/login',   to: 'sessions#create', as: :log_in
  delete '/log_out' => 'sessions#destroy', as: :log_out

  get '/sign_in' => 'registrations#new', as: :registrations
  post '/sign_in' => 'registrations#create', as: :sign_in

end
