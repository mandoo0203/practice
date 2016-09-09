App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log("received message: #{data.message}")
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    @perform "speak", message: message