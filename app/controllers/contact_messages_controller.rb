class ContactMessagesController < ApplicationController
  def index
    @messages = ContactMessage.all
  end

  def show
    @message = ContactMessage.find(params[:id])
  end
end
