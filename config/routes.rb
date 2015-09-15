Rails.application.routes.draw do
  resources :restaurants do 
    resources :reviews, only: [:new, :create]
  end
  
  resources :categories 
  resources :users, only: [ :new, :create, :show ]
  
  get    'login', to: 'sessions#new'
  post   'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end