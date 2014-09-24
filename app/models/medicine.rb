class Medicine < ActiveRecord::Base
  attr_accessible :medicine_type_id, :name
  has_many :medicine_patient_relationships
  has_many :patients, through: :medicine_patient_relationships

  belongs_to :medicine_type
end
