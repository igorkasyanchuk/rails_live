class Event < ApplicationRecord
    after_create :notify

  def notify
    RailsLive.notify({
      message: "new event created",
      category: 'new_event',
      tags: {
        'new_event' => 'black'
      }
    })
  end
end
