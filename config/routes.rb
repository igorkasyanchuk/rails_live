RailsLive::Engine.routes.draw do
  root to: 'stream#index'
  mount ActionCable.server, at: '/cable'
end

if RailsLive.automatic_routes_mount
  Rails.application.routes.draw do
    mount_rails_live_routes
  end
end