class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new
    @message.sender_id = params[:sender_id]
    @message.receiver_id = params[:receiver_id]
    @message.message = params[:message]
    @message.listing_id = params[:listing_id]

    if @message.save
      redirect_to "/messages", :notice => "Message created successfully."
    else
      render 'new'
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    @message.sender_id = params[:sender_id]
    @message.receiver_id = params[:receiver_id]
    @message.message = params[:message]
    @message.listing_id = params[:listing_id]

    if @message.save
      redirect_to "/messages", :notice => "Message updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @message = Message.find(params[:id])

    @message.destroy

    redirect_to "/messages", :notice => "Message deleted."
  end
end
