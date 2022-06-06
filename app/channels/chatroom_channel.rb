class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # specify the specific chatroom that I'm going to be streaming from
    # stream from it
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
