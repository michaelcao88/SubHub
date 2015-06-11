require 'open-uri'
require 'json'

class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])

    # get latitude and longitude
    url_safe_street_address = URI.encode(@listing.address)
    google_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_street_address}"
    parsed_data = JSON.parse(open(google_url).read)
    @lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @lng = parsed_data["results"][0]["geometry"]["location"]["lng"]
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new
    @listing.start_date = params[:start_date]
    @listing.description = params[:description]
    @listing.rent = params[:rent]
    @listing.title = params[:title]
    @listing.end_date = params[:end_date]
    @listing.address = params[:address]
    @listing.user_id = current_user.id

    if @listing.save
      redirect_to "/listings", :notice => "Listing created successfully."
    else
      render 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    @listing.start_date = params[:start_date]
    @listing.description = params[:description]
    @listing.rent = params[:rent]
    @listing.title = params[:title]
    @listing.end_date = params[:end_date]
    @listing.address = params[:address]
    @listing.user_id = current_user.id

    if @listing.save
      redirect_to "/listings", :notice => "Listing updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])

    @listing.destroy

    redirect_to "/listings", :notice => "Listing deleted."
  end
end
