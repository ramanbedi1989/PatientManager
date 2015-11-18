class SmsSend
	def initialize
    @sms = SMS.new("http://site24.way2sms.com") 
    @sms.login("9855091006", "P8232K")
	end
	
	def send(number, message)
    @sms.send_message("ss", number, message)
  end
end