class IdProof < ActiveRecord::Base
#  attr_accessible :id_proof
  
  has_many :patients
end
