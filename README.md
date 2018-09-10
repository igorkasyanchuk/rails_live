# Rails Live

Watch application activities in **real-time** using them gem. Live stream for all events which you want to monitor.

Use tags, categories, custom message and even user. Get better picture of what happening on server.

## Demo

Link to video: https://www.youtube.com/watch?v=1PhyEgU7Pao

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_live/master/docs/screenshot.png"
/>](https://www.youtube.com/watch?v=1PhyEgU7Pao)

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

Note: it doesn't store all events in DB. It just broadcasting them to dashboard.

## Installation

```ruby
gem 'rails_live'
```

And then execute:
```bash
$ bundle
```

## Customization

If you want to customize gem (create initializer) run in console:

    rails g rails_live initializer

If will create file config/initializers/rails_live.rb.

### Options
*   **enabled** - enable or disable gem (default: true).
*   **automatic_routes_mount** - automatically mount engine routes in your app (default: true).
*   **http_basic_authentication_enabled** - Enable HTTP_BASIC authentication (default: false).
*   **http_basic_authentication_user_name** - HTTP_BASIC authentication user name.
*   **http_basic_authentication_password** - HTTP_BASIC authentication password.

If you want to add routes manually (or customize the mounted location) you need to first turn off `automatic_routes_mount` and then add to your `routes.rb`

```ruby
  mount RailsLive::Engine => '/rails/live', :as => 'rails_live'
```

### Tags

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_live/master/docs/tags.png"
/>](https://github.com/igorkasyanchuk/rails_live)

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
