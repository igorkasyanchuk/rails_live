module RailsLive
  class UpdatesChannel < ApplicationCable::Channel
    def subscribed
      stream_from "updates_channel"
    end

    def unsubscribed
    end
  end
end
