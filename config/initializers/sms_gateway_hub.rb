module SMSGatewayHub
  class SendSMS
    BASE_URL = "http://login.smsgatewayhub.com/api/mt/SendSMS"
    def self.send_sms(parameters)
      url = URI.parse(BASE_URL)
      query = URI.encode_www_form(parameters.to_hash)
      url.query = query
      puts url
      request = Net::HTTP.get(url)
      #request = Net::HTTP.post_form(url, parameters.to_hash)
    end
  end

  class ParamsSMS
    def initialize(username, password, apikey, to, message, is_english, is_promotional, sid = "WEBSMS", route = 1, flashsms=0)
      @user = username
      @password = password
      @APIKey = apikey
      @number = to ? to.join(",") : ""
      @DCS = is_english ? "0" : "8"
      @channel = is_promotional ? "1" : "2"
      @route = route
      @text = message#is_english ? message : message.chars.map{ |m| sprintf("%04x", m.ord) }.join("")
      @senderid = sid
      @flashsms=flashsms
    end

    def to_hash
      self.instance_values
    end
  end
end