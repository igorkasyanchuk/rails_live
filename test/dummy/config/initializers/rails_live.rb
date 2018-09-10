unless defined?(RailsLive)
  module RailsLive
    def RailsLive.notify(*options)
      # do nothing
      # gem is not added, so just keep work
    end
  end
end