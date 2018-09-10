# Rails Live Stream

With this gem you can monitor real-time events on server using websockets.

If doesn't store all events in DB.

## Usage

Just open in browser `/rails/live` and watch for updates. BUT to capture them you need to add code something like:

```ruby
  after_create :notify
  def notify
    RailsLive.notify({
      message: "article id: #{self.id} created",
      tags: {
        category.name => 'info',
      },
      category: 'article'
    })
  end
```

or

```ruby
  before_action :log_action

def log_action
    RailsLive.notify({
      message: "action on server #{request.url}",
      tags: {
        action_name => 'light',
      },
      user: {
        id: current_user&.id,
        full_name: current_user&.full_name
      },
      category: controller_name
    })
  end
```

or anywhere from code

```ruby
    RailsLive.notify({
      message: "action on server #{request.url}",
      tags: {
        'admin' => 'danger',
        'approved' => 'success',
      },
      user: {
        id: user.id,
        full_name: user&.full_name
      },
      category: 'category'
    })
```

## Installation

```ruby
gem 'rails_live'
```

And then execute:
```bash
$ bundle
```

## Contributing

You are welcome to contribute to this gem.

## TODO

* add support for older versions (for example 5.1, 5.0)
* add filtering
* add start/stop capturing events
* localications for datetime
* maybe column customization?

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
