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
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = 'Message sent'
      redirect_to root_path
    else
      flash[:error] = 'There is some problem'
      render 'new'
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