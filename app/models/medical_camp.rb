class MedicalCamp < ActiveRecord::Base
  attr_accessible :name
  has_many :medical_camp_patient_relationships
  has_many :patients, through: :medical_camp_patient_relationships
end
