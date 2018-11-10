class Town < ActiveRecord::Base
#  attr_accessible :town, :district_id

  validates :district_id, presence: true
  
  belongs_to :district
  has_many :patients
end
