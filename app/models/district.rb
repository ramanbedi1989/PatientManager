class District < ActiveRecord::Base
  attr_accessible :district
  
  has_many :towns
end
