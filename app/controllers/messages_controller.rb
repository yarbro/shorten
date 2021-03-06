class MessagesController < ApplicationController
  def create
    @link = Link.find(params[:id])
    @message = Message.new(message_params)

    if @message.valid?
      if TextMessenger.new(@message.number, redirect_link_url(@link.name)).deliver
        redirect_to links_path, notice: 'SMS sent successfully!'
      else
        flash.now[:error] = 'SMS could not be sent please try again.'
        render 'links/show'
      end
    else
      flash.now[:error] = 'There was an error on the form please retry.'
      render 'links/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:number)
  end
end
