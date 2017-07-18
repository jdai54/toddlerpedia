Rails.application.routes.draw do

  get 'charges/create'

  resources :wikis
  resources :charges, only: [:new, :create]
  get '/charges', to: 'charges#delete', as: :downgrade

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
