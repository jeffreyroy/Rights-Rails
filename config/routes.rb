Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :issues
  get 'issues/:issue_id/citations/:id' => 'cases#show_citation'
  post 'issues/:issue_id/cases/:case_id' => 'cases#citations'

  resources :users
  post 'users/new' => 'users#create'

  resources :cases
  resources :sessions
  post 'sessions/new' => 'sessions#create'

  resources :opinions

end
