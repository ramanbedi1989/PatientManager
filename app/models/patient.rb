class Patient < ActiveRecord::Base
  attr_accessible :address, :age, :date, :gender, :name, :id_proof_number, :mobile,:father_spouse, :district_id, :id_proof_id, :medical_department_ids
  VALID_GENDERS = ["Male" , "Female"]
  belongs_to :id_proof 
  belongs_to :district
  has_many :memberships
  has_many :medical_departments, through: :memberships
  
end
