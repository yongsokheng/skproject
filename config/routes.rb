Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "pages#index"
  resources :artists
  resources :productions
  resources :albums
  resources :songs
  get "search" => "songs#search"
  get "update_number/:type/:id" => "songs#update_number"
  get "top" => "songs#top_song", as: :top
end
