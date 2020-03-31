Rails.application.routes.draw do
  resources :tweets
  devise_for :users
  root 'tweets#index'
  get 'tweets/index'
  get 'tweets/new'
  get 'tweets/show'
  get 'tweets/create'
  get 'tweets/update'
  get 'tweets/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
