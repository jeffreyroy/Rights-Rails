Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :issues do
    resources :cases
  end
  get 'issues/:issue_id/citations/:id' => 'cases#show_citation'
  post 'issues/:issue_id/cases/:case_id' => 'cases#citations'
  get 'issues/:issue_id/cases/new' => 'cases#new'
  post 'issues/:issue_id/cases' => 'cases#create'

  resources :users
  post 'users/new' => 'users#create'

  resources :cases

  resources :sessions
  post 'sessions/new' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  resources :opinions

  get 'justices' => 'justices#index'

end
