class MedicinePacksPatientsRelationship < ActiveRecord::Base
  belongs_to :patient   
  belongs_to :medicine_pack
  belongs_to :medical_camp

  after_save :create_medicine_patient_relationship

  validates :patient_id, :medicine_pack_id, presence: true

  def create_medicine_patient_relationship
    patient_medicines = self.patient.medicines
    self.medicine_pack.medicines.each do |medicine|
      unless patient_medicines.include? medicine
        MedicinePatientRelationship.create(patient: self.patient, medicine: medicine, medical_camp: self.medical_camp)
      end
    end
  end

  before_save do 
    self.name ||= "#{self.medicine_pack.name} - #{self.patient.name}" 
    if self.medical_camp.blank?
      medical_camps = self.patient.medical_camps.order("medical_camps.created_at DESC")
      if medical_camps.present?
        self.medical_camp = medical_camps.first
      else
        self.medical_camp = MedicalCamp.last
      end
    end
  end
end
