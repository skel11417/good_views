Rails.application.routes.draw do
  resources :reviews
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show]
  post '/movies/avg/', to: 'movies#average_rating'
end
