TEMPLATE = '<a class="panel-block animated fadeInDown">
      <div class="columns is-12 full-screen-columns">
        <div class="column is-three-fifths">
          {{message}}
        </div>
        <div class="column">
          {{#user}}
            {{full_name}}
            {{#id}}
              ({{.}})
            {{/id}}
          {{/user}}
        </div>
        <div class="column">
          {{category}}
        </div>
        <div class="column">
          <div class="tags">
            {{#tags}}
              <span class="tag is-small is-{{@val}}">{{@key}}</span>
            {{/tags}}
          </div>
        </div>
        <div class="column">
          <small>{{datetime}}</small>
        </div>
      </div>
    </a>';

App.updates = App.cable.subscriptions.create "RailsLive::UpdatesChannel",
  connected: ->
    console.log('connected')

  disconnected: ->
    console.log('disconnected')

  received: (data) ->
    $('.waiting-for-updates').hide()

    options = {}
    options['datetime'] = data['datetime']
    options['tags']     = objs2list(data['tags'])
    options['message']  = data['message']
    options['category'] = data['category']
    options['user']     = data['user']

    html = Mustache.to_html(TEMPLATE, options)
    $('#messages').prepend(html)