class Medicine < ActiveRecord::Base
#  attr_accessible :medicine_type_id, :name
  validates :name, presence: true, uniqueness: true
  has_many :medicine_patient_relationships
  has_many :patients, through: :medicine_patient_relationships

  has_many :medicines_medicine_packs_relationships
  has_many :medicine_packs, through: :medicines_medicine_packs_relationships
  belongs_to :dossage_type
  belongs_to :frequency_type

  belongs_to :medicine_type

  before_save do 
  	self.medicine_type ||= MedicineType.find(6)
  end
end
