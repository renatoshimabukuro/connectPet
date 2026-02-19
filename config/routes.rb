Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :clinics, only: [:index, :show] #showing the clinics to all
  resources :users, only: [:show, :new, :create] do
    resources :pets, only: [:show, :new, :create, :index] do
      resources :logs, only: [:index, :new, :create, :edit, :update, :show]
    end
    resources :clinics, except: [:index, :show]
    resources :friendships, except: [:destroy]
    resources :chats, except: [:destroy] do
      resources :messages, except: [:destroy]
    end
  end
end
