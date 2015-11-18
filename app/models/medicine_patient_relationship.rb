class MedicinePatientRelationship < ActiveRecord::Base
#  attr_accessible :dosage_quantity, :dossage_type_id, :frequency, :frequency_type_id, :medicine_id, :patient_id, :special_instruction_id
  belongs_to :patient
  belongs_to :medicine
  belongs_to :medical_camp
  belongs_to :dossage_type
  belongs_to :frequency_type
  has_many :medicine_patient_special_instruction_relationships
  has_many :special_instructions, through: :medicine_patient_special_instruction_relationships

  after_initialize do
    if new_record?
      self.medical_camp ||= MedicalCamp.last # be VERY careful with ||= and False values
    end
    med = self.medicine
    if med
      self.dossage_type ||=  med.dossage_type
      self.frequency_type ||= med.frequency_type
      self.dosage_quantity ||= med.default_dossage_quantity
      self.frequency ||= med.default_frequency
      self.days_taken ||= med.default_days_taken
      if med.medicine_type
        med_type_si = med.medicine_type.special_instructions
        if self.special_instructions.blank?
          self.special_instructions = med_type_si
        end
      end
    end
  end

  before_save do 
  	self.name ||= "#{self.medicine.name} - #{self.patient.name}" 	
  end
end
