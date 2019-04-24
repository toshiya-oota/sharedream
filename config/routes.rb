Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do 
      get :user_sharedreams
    end
  end
  resources :dreams, only: [:create, :destroy]
  resources :sharedreams, only: [:create, :destroy]
end
