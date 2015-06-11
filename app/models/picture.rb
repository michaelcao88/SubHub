class Picture < ActiveRecord::Base
  validates :picture_url, :presence => true
  validates :listing_id, :presence => true

  belongs_to :listing , :class_name => "Listing", :foreign_key => "listing_id"
end
