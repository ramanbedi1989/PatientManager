class MedicalCampPatientRelationship < ActiveRecord::Base
  attr_accessible :medical_camp_id, :patient_id
  belongs_to :patient
  belongs_to :medical_camp
end
