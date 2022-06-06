class MessagesController < ApplicationController
  def create
    # a message
    # a chatroom
    # connert the message to the chatroom
    # a user
    # connect the message to the user
    # redirect
    @message = Message.new(message_params)
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      # broadcast to the ChatroomChannel
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
      # redirect_to chatroom_path(@chatroom, anchor: "message-#{ @message.id}")
      # /chatrooms/78
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
