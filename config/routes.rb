Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :owners

  get '/search' => 'owners#search', :as => 'search_page'

  resources :users

  get '/owners/confirmation' => 'owners#confirmation'
  
end
