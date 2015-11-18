class MedicinePatientSpecialInstructionRelationship < ActiveRecord::Base
  belongs_to :medicine_patient_relationship
  belongs_to :special_instruction
end
