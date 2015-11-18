class ChatsController < ApplicationController
	def create
    common_chat_location = ChatLocation.first
    @message = Chat.create(to_location: common_chat_location, from_location: common_chat_location, message: params[:message])
    if @message.present? && @message.valid?
  		render 'chats/create'
  	else
  		render nothing: true
  	end
	end
end