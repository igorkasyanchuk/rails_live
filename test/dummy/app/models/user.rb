# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  after_create :notify_created
  after_update :notify_updated

  def notify_created
    RailsLive.notify({
      message: "new user created",
      category: 'new_user',
      tags: {
        'account': 'danger'
      }
    })
  end

  def notify_updated
    RailsLive.notify({
      message: "new user updated",
      category: 'user_update',
      tags: {
        'account': 'primary',
        'admin': 'danger',
        'moderator': 'warning'
      }
    })
  end

end
