module RailsLive
  class Engine < ::Rails::Engine
    isolate_namespace RailsLive

    initializer 'rails_live.assets_precompile', :group => :all do |app|
      app.config.assets.precompile += ['rails_live/application.js', 'rails_live/application.css', 'rails_live/*.png', 'rails_live/*.svg', 'rails_live/*.ico']
      app.config.assets.precompile += ['rails_live/bulma.min.css']
    end    
  end
end
