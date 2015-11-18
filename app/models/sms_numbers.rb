class SmsNumbers < ActiveRecord::Base
	validates :number, presence: true, length: { :maximum => 10 }
end
