class Listing < ActiveRecord::Base
  validates :address, :presence => true, :uniqueness => true
  validates :title, :presence => true
  validates :rent, :presence => true
  validates :description, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validates :user_id, :presence => true

  belongs_to :user
  has_many :pictures , :class_name => "Picture", :foreign_key => "listing_id"
  has_many :messages , :class_name => "Message", :foreign_key => "listing_id"
end
