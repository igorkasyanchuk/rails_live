$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "rails_live/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_live"
  s.version     = RailsLive::VERSION
  s.authors     = ["Igor Kasyanchuk"]
  s.email       = ["igorkasyanchuk@gmail.com"]
  s.homepage    = "https://github.com/igorkasyanchuk/rails_live"
  s.summary     = "See in live what is happening on server"
  s.description = "See in live what is happening on server in real-time. Track all activities."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"
  s.add_dependency "coffee-rails"
  s.add_dependency "redis"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "puma"
  s.add_development_dependency "pry"
  s.add_development_dependency "redis"
  s.add_development_dependency 'bootstrap', '~> 4.1.3'
end
