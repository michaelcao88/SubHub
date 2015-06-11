class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new
    @picture.listing_id = params[:listing_id]
    @picture.picture_url = params[:picture_url]

    if @picture.save
      redirect_to "/pictures", :notice => "Picture created successfully."
    else
      render 'new'
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.listing_id = params[:listing_id]
    @picture.picture_url = params[:picture_url]

    if @picture.save
      redirect_to "/pictures", :notice => "Picture updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])

    @picture.destroy

    redirect_to "/pictures", :notice => "Picture deleted."
  end
end
