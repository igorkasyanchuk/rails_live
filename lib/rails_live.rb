module RailsLive

  # is enabled?
  mattr_accessor :enabled
  @@enabled = true

  # automatic engine routes mouting
  mattr_accessor :automatic_routes_mount
  @@automatic_routes_mount = true

  # Enable http basic authentication
  mattr_accessor :http_basic_authentication_enabled
  @@http_basic_authentication_enabled = false

  # Enable http basic authentication
  mattr_accessor :http_basic_authentication_user_name
  @@http_basic_authentication_user_name = 'rails_live'

  # Enable http basic authentication
  mattr_accessor :http_basic_authentication_password
  @@http_basic_authentication_password = 'passw0))rd'

  def RailsLive.notify(message:, tags: [], user: {}, category: nil, datetime: Time.now)
    return unless enabled

    ActionCable.server.broadcast 'updates_channel', 
      message: message,
      tags: tags,
      user: user,
      category: category,
      datetime: datetime.strftime('%H:%M:%S')
  end

  def self.setup
    yield(self)
  end

  def self.use_default_configuration!
    self.enabled                            = true
    self.http_basic_authentication_enabled  = false
    self.automatic_routes_mount             = true
  end  

end

require "rails_live/engine"
require "rails/routes"

