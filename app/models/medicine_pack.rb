class MedicinePack < ActiveRecord::Base
  has_many :medicines_medicine_packs_relationships
  has_many :medicines, through: :medicines_medicine_packs_relationships
  has_many :medicine_packs_patients_relationships
  has_many :patients, through: :medicine_packs_patients_relationships
end
