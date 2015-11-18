class MedicineType < ActiveRecord::Base
#  attr_accessible :name
  has_many :medicine_type_special_instruction_relationships
  has_many :special_instructions, through: :medicine_type_special_instruction_relationships
  has_many :medicines
end
