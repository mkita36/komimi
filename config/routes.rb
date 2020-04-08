Rails.application.routes.draw do

  root to: 'timelines#index'
  get 'timelines/index'

  resources :profiles, except:[:index, :destroy]

  resources :tweets do
    resources :replies, except:[:show]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end