# encoding: utf-8
class SendSMS
  @@hindi_text = "आँखोँ , दांतो और अन्य स्वास्थ्य सुविधाओ का फ्री कैंप 20 - 22 नवंबर 2015, जिन्द बाबा चैरिटेबल मेडिकल फैसिलिटी शाहतलाई। अशोक - 09815845999, 01978264010"
	def self.send_sms_from_db
		SmsNumbers.find_in_batches(batch_size: 100) do |numbers|
      sms_instance = SMSGatewayHub::ParamsSMS.new("ramanbedi1989", "850858", "4288d2b0-492f-411c-97c8-4a809df89be1", numbers.map(&:number), @@hindi_text, false, true)
      response = SMSGatewayHub::SendSMS.send_sms(sms_instance)
      puts response
      numbers.each do |num|
        num.update(count: (num.count + 1), last_sent_at: Time.now)
      end
		end
	end

	def self.send_sms_to_number(num)
    sms_instance = SMSGatewayHub::ParamsSMS.new("ramanbedi1989", "850858", "4288d2b0-492f-411c-97c8-4a809df89be1", ((num.is_a? Array) ? num : [num]), @@hindi_text, false, true)
    SMSGatewayHub::SendSMS.send_sms(sms_instance)
	end
end