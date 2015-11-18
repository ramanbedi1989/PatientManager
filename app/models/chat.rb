class Chat < ActiveRecord::Base
	belongs_to :to_location, :class_name => "ChatLocation", :foreign_key => "to"
	belongs_to :from_location, :class_name => "ChatLocation", :foreign_key => "from"
  validates :message, presence: true
end
