Rails.application.routes.draw do

  root to: 'timelines#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :timelines, only:[:index, :create]
  resources :users, only:[:index] do
    resources :profiles, except:[:index, :destroy]
    resources :replies, only:[:index]
  end
  resources :tweets, except:[:new, :edit, :update] do
    resources :replies, except:[:index, :show, :new]
  end

  post 'follow/:id', to: 'relationships#follow', as: 'follow'
  post 'unfollow/:id', to: 'relationships#unfollow', as: 'unfollow'
  get 'followindex/:id', to: 'users#followindex', as: 'followindex'
  get 'followerindex/:id', to: 'users#followerindex', as: 'followerindex'

end