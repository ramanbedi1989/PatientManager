class MedicalCamp < ActiveRecord::Base
 # attr_accessible :name
  has_many :medical_camp_patient_relationships
  has_many :patients, through: :medical_camp_patient_relationships
  has_many :medicine_patient_relationships
  has_many :medicine_packs_patients_relationships
end
