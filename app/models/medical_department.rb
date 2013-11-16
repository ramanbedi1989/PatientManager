class MedicalDepartment < ActiveRecord::Base
  attr_accessible :medical_department
  
  has_many :memberships
  has_many :patients, through: :memberships
end