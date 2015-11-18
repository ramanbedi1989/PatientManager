class SpecialInstruction < ActiveRecord::Base
#  attr_accessible :name, :hindi_name
  has_many :medicine_patient_special_instruction_relationships
  has_many :medicine_patient_relationships, through: :medicine_patient_special_instruction_relationships
  has_many :medicine_type_special_instruction_relationships
  has_many :medicine_types, through: :medicine_type_special_instruction_relationships
end
