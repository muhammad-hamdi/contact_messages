class Api::ContactMessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  def index
    @messages = ContactMessage.order('id DESC').paginate(page: params[:page] ? params[:page] : 1)

    json_response({data: @messages, pagination: pagination})
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

    def current_page
      params[:page] ? params[:page].to_i : 1.to_i;
    end

    def total_pages
      (ContactMessage.count / ContactMessage.per_page.to_f).ceil
    end

    def pagination
      {
          "current": current_page,
          "first": "/contact_messages?page=1",
          "last": "/contact_messages?page=#{total_pages}",
          "next": current_page+1 <= total_pages ? "/contact_messages?page=#{current_page+1}" : nil,
          "prev": current_page > 1 ? "/contact_messages?page=#{current_page-1}" : nil
      }
    end
end
