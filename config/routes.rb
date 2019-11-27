Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do 
      get :followdreams
      get :dreamfollowers
    end
  end
    resources :dreams, only: [:show,:create,:edit,:update, :destroy] do
    resources :comments, only: [:create,:destroy]
  end
  
  resources :relationships, only: [:create, :destroy]
end
