Rails.application.routes.draw do
  
  resources :noko_movies
  post 'users/create', to: "users#create"
  post "/auth/create", to: "auth#create"
  get "/auth/show", to: "auth#show"

  get "/favorites", to: "favorites#my_favorites"
  post "/favorites", to: "favorites#add_favorites"
  delete "/favorites", to: "favorites#remove_favorite"
  
  post '/movies/search', to: "search#index"
  get '/movies/search', to: "search#index"
  get "/movies/random", to: "search#random_movies_end"
  resources :movies, only: [:index, :show]
  post '/movies', to: "movies#index"
  post '/movies/:id', to: "movies#show"
 
  resources :credits, only: [:index]

  post '/credits', to: "credits#index"
  resources :trailers, only: [:index]

  post '/trailers', to: "trailers#index"

end
