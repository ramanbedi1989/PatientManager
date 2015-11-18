class MedicineTypeSpecialInstructionRelationship < ActiveRecord::Base
	belongs_to :medicine_type
  belongs_to :special_instruction
end
