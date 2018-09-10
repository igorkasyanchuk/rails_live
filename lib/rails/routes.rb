module ActionDispatch::Routing
  class Mapper
    def mount_rails_live_routes(options = {})
      mount RailsLive::Engine => '/rails/live', :as => options[:as] || 'rails_live'
    end
  end
end