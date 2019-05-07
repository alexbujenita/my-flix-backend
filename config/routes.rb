Rails.application.routes.draw do
  
  resources :movies, only: [:index, :show]

  post '/movies', to: "movies#index"
  post '/movies/:id', to: "movies#show"
 
  resources :credits, only: [:index]

  post '/credits', to: "credits#index"

  resources :trailers, only: [:index]

  post '/trailers', to: "trailers#index"

end
