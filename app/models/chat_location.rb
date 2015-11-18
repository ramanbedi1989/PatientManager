class ChatLocation < ActiveRecord::Base
	has_many :to_chats, :class_name => "Chat", :foreign_key => "to"
  has_many :from_chats, :class_name => "Chat", :foreign_key => "from"
end
