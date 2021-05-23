Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'topics#index'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  resources :users do
    member do
      get :topics
    end
  end
  resources :topics do
    resources :posts
    resources :participations, only: [:create, :destroy]
  end
end
