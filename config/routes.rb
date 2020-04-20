Rails.application.routes.draw do

  root to: 'timelines#index'

  resources :profiles, except:[:index, :destroy]
  resources :timelines, only:[:index, :create]
  resources :tweets, except:[:new, :edit, :update] do
    resources :replies, except:[:show, :new]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end