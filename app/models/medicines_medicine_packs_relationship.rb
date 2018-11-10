class MedicinesMedicinePacksRelationship < ActiveRecord::Base
  belongs_to :medicine
  belongs_to :medicine_pack

  before_save do 
    self.name ||= "#{self.medicine.name} - #{self.medicine_pack.name}"  
  end
end
