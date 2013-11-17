class Town < ActiveRecord::Base
  attr_accessible :town, :district_id
  
  belongs_to :district
  has_many :patients
end
