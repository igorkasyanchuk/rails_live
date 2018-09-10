if Object.const_defined?('RailsLive')
  RailsLive.setup do |config|
    # # enabled or not
    # config.enabled = Rails.env.development?

    # # automatic engine routes mounting
    # config.automatic_routes_mount = true

    # # Enable http basic authentication
    # config.http_basic_authentication_enabled = false

    # # Enable http basic authentication
    # config.http_basic_authentication_user_name = 'rails_db'

    # # Enable http basic authentication
    # config.http_basic_authentication_password = 'passw0))rd'
  end
end

unless defined?(RailsLive)
  module RailsLive
    def RailsLive.notify(*options)
      # do nothing
      # gem is not added, so just keep work
    end
  end
end