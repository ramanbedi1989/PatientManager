class Membership < ActiveRecord::Base
  attr_accessible :created_at, :medical_department_id, :patient_id
  
  belongs_to :patient
  belongs_to :medical_department
end
