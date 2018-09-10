TEMPLATE = '<tr class="animated slideInDown">
              <td>
                {{datetime}}
              </td>
              <td>{{message}}</td>
              <td>
                {{#user}}
                  {{full_name}}
                  {{#id}}
                    ({{.}})
                  {{/id}}
                {{/user}}
              </td>
              <td>
                {{category}}
              </td>
              <td>
                <div class="tags">
                  {{#tags}}
                    <span class="tag is-small is-{{@val}}">{{@key}}</span>
                  {{/tags}}
                </div>
              </td>
            </tr>';

App.updates = App.cable.subscriptions.create "RailsLive::UpdatesChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    $('.waiting-for-updates').hide()
    $('#messages').removeClass('is-hidden')

    options = {}
    options['datetime'] = data['datetime']
    options['tags']     = objs2list(data['tags'])
    options['message']  = data['message']
    options['category'] = data['category']
    options['user']     = data['user']

    html = Mustache.to_html(TEMPLATE, options)
    $('#messages').prepend(html)