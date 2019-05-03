Rails.application.routes.draw do
  post '/movies', to: "movies#index"
  get '/movies', to: "movies#index"
end
