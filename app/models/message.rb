class Message < ActiveRecord::Base
  validates :message, :presence => true
  validates :sender_id, :presence => true
  validates :receiver_id, :presence => true
  validates :listing_id, :presence => true

  belongs_to :sender , :class_name => "User", :foreign_key => "sender_id"
  belongs_to :receiver , :class_name => "User", :foreign_key => "receiver_id"
  belongs_to :listing , :class_name => "Listing", :foreign_key => "listing_id"
end
