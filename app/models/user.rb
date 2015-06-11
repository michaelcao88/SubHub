class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  has_many :listings
  has_many :messages , :class_name => "Message", :foreign_key => "sender_id"
  has_many :received_messages , :class_name => "Message", :foreign_key => "receiver_id"
end
