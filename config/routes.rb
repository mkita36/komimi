Rails.application.routes.draw do

  root to: 'timelines#index'
  get 'timelines/index'
  post 'timelines/create'

  resources :profiles, except:[:index, :destroy]

  resources :tweets, exept:[:new] do
    resources :replies, except:[:show, :new]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end