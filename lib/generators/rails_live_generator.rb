class RailsLiveGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  def copy_initializer
    template 'rails_live.rb', 'config/initializers/rails_live.rb'
  end
end