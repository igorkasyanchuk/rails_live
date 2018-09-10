module RailsLive
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    if RailsLive.http_basic_authentication_enabled
      http_basic_authenticate_with name: RailsLive.http_basic_authentication_user_name,
                                   password: RailsLive.http_basic_authentication_password
    end
  end
end
