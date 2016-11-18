class ScrollMessagesController < ApplicationController
	def index
		@messages=ScrollMessage.all
	end
	
	def new 
		@message=ScrollMessage.new
	end
	
	def create
		@message=ScrollMessage.new(msg_params)
		if @message.save
			redirect_to root_path
		else
			redirect_to root_path
		end		
	end	

	private
	def msg_params
		params.require(:scroll_message).permit(:scroll_msg, :current_msg)
	end		
end
