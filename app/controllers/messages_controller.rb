class MessagesController < ApplicationController
  before_action :set_message, only: [:show]

  def index
    @messages = current_user.received_messages
  end

  def show
    @message.read_at = Time.now
    @message.save
  end

  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
    else
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:subject, :body, :sender_id, :recipient_id, :read_at)
    end
end