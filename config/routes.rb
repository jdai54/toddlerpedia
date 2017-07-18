Rails.application.routes.draw do

  get 'charges/create'

  get '/charges', to: 'charges#delete', as: :downgrade

  resources :charges, only: [:new, :create, :delete]

  resources :wikis



  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
