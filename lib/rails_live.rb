require "rails_live/engine"

module RailsLive

  def RailsLive.notify(message:, tags: [], user: {}, category: nil, datetime: Time.now)
    ActionCable.server.broadcast 'updates_channel', 
      message: message,
      tags: tags,
      user: user,
      category: category,
      datetime: datetime.strftime('%H:%M:%S')
  end

end
