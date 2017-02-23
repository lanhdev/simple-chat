Rails.application.routes.draw do
  resources :messages
  resources :sessions, only: [:new, :create] # equivalent: get 'sign_up' => 'sessions#new' get 'sign_in' => 'sessions#create'
  resources :users
  root 'home#index'
  delete 'sign_out' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
