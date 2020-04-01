Rails.application.routes.draw do
  
  resources :profiles, except:[:new] do
    get:new, on: :member
  end

  resources :replies, except:[:new] do
    get:new, on: :member
  end

  resources :tweets

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'tweets#index'

end
