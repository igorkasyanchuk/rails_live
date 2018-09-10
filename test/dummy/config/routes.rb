Rails.application.routes.draw do
  resources :events
  resources :users
  root to: 'users#index'
  mount RailsLive::Engine => "/rails/live"
end
