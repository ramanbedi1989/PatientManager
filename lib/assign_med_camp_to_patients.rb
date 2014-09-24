class AssignMedCampToPatients
	def assign
		m = MedicalCamp.first
		Patient.all.each do |p| 
			MedicalCampPatientRelationship.create(medical_camp_id: m.id, patient_id: p.id) 
		end
	end
end