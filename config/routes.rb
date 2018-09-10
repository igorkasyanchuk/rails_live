RailsLive::Engine.routes.draw do
  root to: 'stream#index'
  mount ActionCable.server, at: '/cable'
end
