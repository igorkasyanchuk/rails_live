class ApplicationController < ActionController::Base
  before_action :log_action

  def log_action
    RailsLive.notify({
      message: "action on server #{request.url}",
      tags: {
        action_name => 'light',
      },
      user: {
        id: current_user.id,
        full_name: current_user.full_name
      },
      category: controller_name
    })
  end

  class CurrentUser
    def id
      rand(55)
    end
    def full_name
      ['Igor Kasyanchuk', 'John Smith'].sample
    end
  end

  def current_user
    CurrentUser.new
  end

end
