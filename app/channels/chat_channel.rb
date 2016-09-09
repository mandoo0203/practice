# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
     stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def speak(data)
    logger.info "minsu: #{data['message']}"
    ActionCable.server.broadcast 'chat_channel', message: "#{data['message']} from server"
    
  end
end
