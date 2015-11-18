# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MEDICAL_DEPARTMENTS = ['Eye', 'Dental' , 'Orthopaedic', 'Medicine', 'Ayurvedic', 'Pathology Lab', 'ECG', 'ENT']
DISTRICTS = ['Bilaspur', 'Kangra', 'Una', 'Mandi']
ID_PROOFS = ['Aadhar Card', 'Driving License', 'Ration Card', 'Voter Card']

MEDICAL_DEPARTMENTS.each do |dept|
  MedicalDepartment.create(medical_department: dept)
end

DISTRICTS.each do |dist|
  District.create(district: dist)
end

ID_PROOFS.each do |proof|
  IdProof.create(id_proof: proof)
end
