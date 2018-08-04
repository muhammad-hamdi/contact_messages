class Api::ContactMessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  def index
    @messages = ContactMessage.all

    json_response(@messages)
  end

  def show
    json_response(@message)
  end

  def create
    @message = ContactMessage.create!(message_params)

    json_response(@message, :created)
  end

  def update
    @message.update!(message_params)
    head :no_content
  end

  def destroy
    @message.destroy
    head :no_content
  end

  private
    def message_params
      params.require(:message).permit(:first_name, :last_name, :email, :subject, :description)
    end

    def set_message
      @message = ContactMessage.find(params[:id])
    end
end
