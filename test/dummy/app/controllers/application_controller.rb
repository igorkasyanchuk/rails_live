class ApplicationController < ActionController::Base

  before_action :log_action

  def log_action
    RailsLive.notify({
      message: "action on server #{request.url}",
      tags: {
        'one' => 'success',
        'two' => 'warning',
        rand(100).to_s => 'danger',
      },
      user: {
        id: rand(11),
        full_name: ['Igor', 'Kostya'].sample
      },
      category: controller_name
    })
  end

end
