#rails g resource Pokemon
Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq" 

  resources :pokemons, only: [:index]
  root 'pokemons#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'pokemons/upload', to: 'pokemons#upload'
  post 'pokemons/destroy_all', to: 'pokemons#destroy_all'
end
