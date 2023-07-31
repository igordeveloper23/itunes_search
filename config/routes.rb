Rails.application.routes.draw do
  root 'search#index'
  get '/search', to: 'search#search'
  post '/toggle_favorite', to: 'search#toggle_favorite'
end
