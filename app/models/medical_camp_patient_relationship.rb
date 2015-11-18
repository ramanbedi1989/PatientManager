class MedicalCampPatientRelationship < ActiveRecord::Base
#  attr_accessible :medical_camp_id, :patient_id
  belongs_to :patient
  belongs_to :medical_camp

  after_initialize do
    if new_record?
      self.medical_camp ||= MedicalCamp.last # be VERY careful with ||= and False values
    end
  end
end
