#encoding: utf-8
class GeneratePDF
  HINDI_HEALTH_INSTRUCTIONS = [
    "आयोडीन युक्त नमक का सेवन करें।",
    "गर्भ के दौरान िनयिमत जाँच व आयरन फॉिलक ऐिसड की गोिलयों से जच्चा और",
    "बच्चा दोनों रहें स्वस्थ।",
    "धूम्रपान का सेवन , कैंसर को दावत।",
    "स्वछता अपनाओ रोग भगाओ।"
  ]
  def self.generate(id)
    Dir.chdir("lib/output") do
      patient = Patient.find(id) rescue nil
      image = "#{Dir.pwd}/rotated_image.jpg"
      if patient
        all_patient_medicines = patient.medicine_patient_relationships.to_a
        medicines_index = 0
        Prawn::Document.generate("#{patient.id}.pdf" , margin: 0 , page_size: 'A4') do |pdf|
          pdf.font_families.update("MANGAL"=>{:normal =>"#{Rails.root}/lib/fonts/aparaj.ttf"})
          #pdf.image image, :at  => [0, Prawn::Document::PageGeometry::SIZES["A4"][1]],:fit => Prawn::Document::PageGeometry::SIZES["A4"]
          bounding_box = pdf.bounds
          b_height = bounding_box.height
          b_width = bounding_box.width
          initial_line = 250
          initial_width = 50
          line_diff = 27
          pdf.translate(b_width/2,b_height/2) do
            pdf.rotate 90 do
              pdf.font("MANGAL")
              pdf.font_size(14)
              pdf.draw_text "जय बाबा बालक नाथ जी", at: [initial_width + 80, initial_line]
              pdf.font_size(18)
              pdf.font("Times-Roman")
              initial_line -= line_diff
              pdf.draw_text "Jind Baba Charitable Trust", at: [initial_width + 40, initial_line], style: :bold
              pdf.font_size(16)
              pdf.draw_text "Multispeciality Medical Facility", at: [initial_width+ 38, initial_line - line_diff], style: :bold 
              pdf.draw_text "Shahtalai, HP, Phone: 01978264010", at: [initial_width + 34, initial_line - 2*line_diff], style: :bold 
              pdf.line_width 2
              pdf.horizontal_line (initial_width - 25), 400, at: (initial_line - 2*line_diff - 10)
              pdf.stroke
              initial_line = 130
              initial_width += 5
              pdf.font_size(14)
              pdf.draw_text "Patient ID:", at: [initial_width, initial_line], style: :bold
              pdf.draw_text "#{patient.id}", at: [(new_width = initial_width + pdf.width_of("Patient ID:") + 5) , initial_line], style: :bold
              pdf.draw_text "Date:", at: [(new_width +=  pdf.width_of("#{patient.id}") + 15), initial_line] 
              pdf.draw_text "#{patient.created_at.strftime('%d-%m-%Y')}", at: [(new_width += pdf.width_of("Date:") + 5), initial_line]
              initial_line -= line_diff
              pdf.draw_text "Name:", at: [initial_width,initial_line] 
              pdf.draw_text "#{patient.name}", at: [(new_width = initial_width + pdf.width_of("Name:") + 5),initial_line] 
              pdf.draw_text "Age:", at: [(new_width += pdf.width_of(patient.name) + 15),initial_line] 
              pdf.draw_text "#{patient.age}", at: [(new_width += pdf.width_of("Age:") + 5),initial_line]
              pdf.draw_text "Gender:", at: [(new_width += pdf.width_of(patient.age.to_s) + 15),initial_line] 
              pdf.draw_text "#{patient.gender}", at: [(new_width += pdf.width_of("Gender:") + 5),initial_line]
              pdf.draw_text "Father/Spouse:", at: [(new_width = initial_width), initial_line-line_diff]
              pdf.draw_text "#{patient.father_spouse}", at: [(new_width += pdf.width_of("Father/Spouse:") + 5), initial_line-line_diff]
              pdf.draw_text "Address:", at: [initial_width, initial_line-2*line_diff]
              pdf.draw_text "#{patient.address}", at: [(initial_width + pdf.width_of("Address:") + 5) , initial_line-2*line_diff]
              pdf.horizontal_line (initial_width - 25), 400, at: (initial_line - 2*line_diff - 10)
              pdf.stroke
              if patient.diagnosis.present?
                pdf.draw_text "Diagnosis:", at: [initial_width, initial_line-3*line_diff]
                pdf.draw_text "#{patient.diagnosis}", at: [(initial_width + pdf.width_of("Diagnosis:") + 5) , initial_line-3*line_diff]
              end
              pdf.horizontal_line (initial_width - 25), 400, at: (initial_line - 3*line_diff - 10)
              pdf.stroke
              lower_line_diff = 15
              pdf.font("MANGAL")
              pdf.font_size(12)
              initial_height = initial_line - 4*line_diff
              line_diff = 15
              instruction_width = 100
              i = 0
              while (initial_height - i*line_diff > initial_height - 350) && (medicines_index < all_patient_medicines.count)
                med = all_patient_medicines[medicines_index]
                medicines_index += 1
                pdf.draw_text "#{med.medicine.name}", at: [initial_width,(initial_height - i*line_diff)] 
                i += 1
                pdf.draw_text "#{med.try(:dosage_quantity)} #{med.try(:dossage_type).try(:hindi_name)}, #{med.try(:frequency)} #{med.try(:frequency_type).try(:hindi_name)}, #{med.try(:days_taken)} िदनो के िलए", at: [instruction_width,(initial_height - i*line_diff)] 
                special_instructions = med.special_instructions
                if special_instructions.present?
                  i += 1
                  pdf.draw_text "#{special_instructions.map(&:hindi_name).join(", ")}", at: [instruction_width,(initial_height - i*line_diff)] 
                end
                i += 1
              end
              #pdf.draw_text "Diagnosis #{patient.diagnosis}", at: [ initial_width ,initial_line - 4*line_diff] if patient.diagnosis
              #pdf.draw_text "Contact No. 01978264010", at: [ initial_width ,initial_line - 450]
              # index = 0
              # patient.medical_departments.each do |dept|
              #   pdf.draw_text "#{dept.medical_department}  #{dept.room_no}", at: [ initial_width ,initial_line - 4*line_diff - index*lower_line_diff]
              #   index+=1
              # end
            end
          end
          pdf.translate(0,0) do
            pdf.rotate 90 do
              pdf.font("MANGAL")
              pdf.font_size(12)
              initial_height = -50
              line_diff = 15
              initial_width = 20
              instruction_width = 130
              i = 0
              #all_patient_medicines.each do |med|
              while medicines_index < all_patient_medicines.count
                med = all_patient_medicines[medicines_index]
                medicines_index += 1
                pdf.draw_text "#{med.medicine.name}", at: [initial_width,(initial_height - i*line_diff)] 
                i += 1
                pdf.draw_text "#{med.try(:dosage_quantity)} #{med.try(:dossage_type).try(:hindi_name)}, #{med.try(:frequency)} #{med.try(:frequency_type).try(:hindi_name)}, #{med.try(:days_taken)} िदनो के िलए", at: [instruction_width,(initial_height - i*line_diff)] 
                special_instructions = med.special_instructions
                if special_instructions.present?
                  i += 1
                  pdf.draw_text "#{special_instructions.map(&:hindi_name).join(", ")}", at: [instruction_width,(initial_height - i*line_diff)] 
                end
                i += 1
              end

              bottom_height = -480
              pdf.horizontal_line (initial_width - 10), 400, at: (bottom_height - 10)
              pdf.stroke
              bottom_height -= 2*line_diff
              HINDI_HEALTH_INSTRUCTIONS.each_with_index do |hindi_guideline, index|
                pdf.draw_text hindi_guideline, at: [initial_width,(bottom_height - index*line_diff)] 
              end
            end
          end
        end
      end
    end
  end
end