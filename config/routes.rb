Rails.application.routes.draw do

  delete '/charges', to: 'charges#delete', as: :downgrade
  resources :charges, only: [:new, :create]
  resources :wikis do
    resources :collaborators
  end

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
