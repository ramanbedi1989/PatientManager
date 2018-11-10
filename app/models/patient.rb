class Patient < ActiveRecord::Base
 # attr_accessible :address, :dob, :date, :gender, :name, :id_proof_number, :mobile,:father_spouse, :town_id, :id_proof_id, :medical_department_ids, :treatment, :medicines, :services, :special_instructions
  attr_accessor :age_input

  include RailsAdminCharts

  validates :name, :gender, presence: true
  VALID_GENDERS = ["Male" , "Female"]
  belongs_to :id_proof 
  belongs_to :town

  has_many :memberships
  has_many :medical_departments, through: :memberships

  has_many :medical_camp_patient_relationships, dependent: :destroy
  has_many :medical_camps, through: :medical_camp_patient_relationships

  has_many :medicine_patient_relationships, dependent: :destroy
  has_many :medicines, through: :medicine_patient_relationships

  has_many :medicine_packs_patients_relationships, dependent: :destroy
  has_many :medicine_packs, through: :medicine_packs_patients_relationships

  validate :has_medical_camps
  validate :has_dob

  accepts_nested_attributes_for :medicine_patient_relationships

  accepts_nested_attributes_for :medicine_packs_patients_relationships

  before_validation :assign_medical_camp

  before_validation :assign_dob

  def district
    self.town.district
  end

  def has_medical_camps
    errors.add(:base, 'must have at least one medical camp') if self.medical_camps.blank?
  end

  def has_dob
    errors.add(:base, 'must have at least Date of Birth or Age defined') if self.dob.blank?
  end

  def assign_medical_camp
    self.medical_camps << MedicalCamp.last if self.medical_camps.blank?
  end

  def assign_dob
    self.dob = Date.today - age_input.to_i.years if self.dob.blank? && age_input.present?
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

  def self.graph_data since=3.days.ago
    self.joins(:medical_camp_patient_relationships).where("medical_camp_patient_relationships.medical_camp_id" => 5).group(:gender).count.to_a
  end

  def self.chart_type
    'pie'
  end
end
