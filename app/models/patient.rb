class Patient < ActiveRecord::Base
 # attr_accessible :address, :dob, :date, :gender, :name, :id_proof_number, :mobile,:father_spouse, :town_id, :id_proof_id, :medical_department_ids, :treatment, :medicines, :services, :special_instructions
  
  validates :name, :gender, :dob, presence: true
  VALID_GENDERS = ["Male" , "Female"]
  belongs_to :id_proof 
  belongs_to :town
  has_many :memberships
  has_many :medical_departments, through: :memberships

  has_many :medical_camp_patient_relationships, dependent: :destroy
  has_many :medical_camps, through: :medical_camp_patient_relationships

  has_many :medicine_patient_relationships, dependent: :destroy
  has_many :medicines, through: :medicine_patient_relationships

  validate :has_medical_camps

  accepts_nested_attributes_for :medicine_patient_relationships

  before_validation :assign_medical_camp

  def has_medical_camps
    errors.add(:base, 'must have at least one medical camp') if self.medical_camps.blank?
  end

  def assign_medical_camp
    self.medical_camps << MedicalCamp.find(3) if self.medical_camps.blank?
  end

  def gender_enum
  	VALID_GENDERS
  end
  
  def printable
    true
  end

  def age
    diff_years = Date.today.year - dob.year
    dob_date = dob.years_since(diff_years)
    diff_days = Date.today.yday - dob_date.yday
    diff_days >= 0 ? diff_years : (diff_years - 1)
  end

end
