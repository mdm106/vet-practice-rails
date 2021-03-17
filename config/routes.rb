Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :owners

  get '/search' => 'owners#search', :as => 'search_page'

  resources :users

  get '/users/confirmation' => 'users#confirmation'

  resources :animals
  
end
