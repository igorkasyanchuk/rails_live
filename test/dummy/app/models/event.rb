# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  context    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
