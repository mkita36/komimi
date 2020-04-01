Rails.application.routes.draw do
  resources :replies, except:[:new] do
    get:new, on: :member
  end

  resources :tweets

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'tweets#index'

end
