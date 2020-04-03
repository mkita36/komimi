Rails.application.routes.draw do
  root to: 'tweets#index'

  resources :profiles, except:%i[index destroy]

  resources :tweets do
    resources :replies
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end