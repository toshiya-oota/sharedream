Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do 
      get :user_sharedreams
      get :followdreams
      get :dreamfollowers
    end
  end
  resources :dreams, only: [:create,:edit,:update, :destroy]
  resources :relationships, only: [:create, :destroy]
end
