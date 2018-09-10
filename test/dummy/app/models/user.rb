class User < ApplicationRecord

  after_create :notify

  def notify
    RailsLive.notify({
      message: "new user created",
      category: 'new_user'
    })
  end

end
