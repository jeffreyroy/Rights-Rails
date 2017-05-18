Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :issues
  resources :users
  post 'users/new' => 'users#create'

  resources :cases
  resources :sessions
  post 'sessions/new' => 'sessions#create'

  resources :opinions

end
