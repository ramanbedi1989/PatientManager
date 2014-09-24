class MedicinePatientRelationship < ActiveRecord::Base
  attr_accessible :dosage_quantity, :dossage_type_id, :frequency, :frequency_type_id, :medicine_id, :patient_id, :special_instruction_id
  belongs_to :patient
  belongs_to :medicine
  belongs_to :dossage_type
  belongs_to :frequency_type
  belongs_to :special_instruction
end
