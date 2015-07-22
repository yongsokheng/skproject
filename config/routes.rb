Rails.application.routes.draw do
  root "pages#index"
  resources :albums
  resources :songs
end
