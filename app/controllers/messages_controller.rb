class MessagesController < ApplicationController
  before_action :check_if_owner, only: [:show, :edit, :update, :destroy]

  def check_if_owner
    message = Message.find(params[:id])
    if message.sender_id != current_user.id && message.receiver_id != current_user.id
        redirect_to "/messages", notice: "Can't access unauthorized message!"
    end
  end

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    @listing = Listing.find(params[:the_listing_id])
    @receiver = User.find(params[:receiver_id])
  end

  def create
    @message = Message.new
    @listing = Listing.find(params[:listing_id])

    @message.sender_id = current_user.id
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
    @listing = Listing.find(params[:listing_id])

    @message.sender_id = current_user.id
    @message.receiver_id = @message.receiver.id
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
