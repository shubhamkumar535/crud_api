Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :sessions, only: [:new, :create, :destroy]  
  get '/signup', to: 'users#new', as: 'signup' 


  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new' 
  get '/logout', to: 'sessions#destroy', as: 'logout'  
  
  resources :users
  resources :movies  

  get 'movies/like/:id' ,to: 'movies#like_me',as: "like"
  get 'movies/dislike/:id' ,to: 'movies#dislike_me',as: "dislike"
  
end
