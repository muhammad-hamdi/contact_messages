class ContactMessagesController < ApplicationController
  def index
    @messages = ContactMessage.paginate(page: params[:page])
  end

  def show
    @message = ContactMessage.find(params[:id])
  end

  def new
  end

  def create
    @message = ContactMessage.new(message_params)

    if @message.save
      redirect_to @message
    else
      render 'new'
    end
  end

  def edit
    @message = ContactMessage.find(params[:id])
  end

  def update
    @message = ContactMessage.find(params[:id])

    if @message.update(message_params)
      redirect_to @message
    else
      render 'edit'
    end
  end

  def destroy
    @message = ContactMessage.find(params[:id])
    @message.destroy

    redirect_to contact_messages_path
  end

  private
    def message_params
      params.require(:message).permit(:first_name, :last_name, :email, :subject, :description)
    end
end
