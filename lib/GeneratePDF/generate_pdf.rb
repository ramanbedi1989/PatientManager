class GeneratePDF
  def self.generate(id)
    Dir.chdir("lib/output") do
      patient = Patient.find(id) rescue nil
      image = "#{Dir.pwd}/rotated_image.jpg"
      if patient
        Prawn::Document.generate("new.pdf" , margin: 0 , page_size: 'A4') do |pdf|
          pdf.font_size(10)
          #pdf.image image, :at  => [0, Prawn::Document::PageGeometry::SIZES["A4"][1]],:fit => Prawn::Document::PageGeometry::SIZES["A4"]
          bounding_box = pdf.bounds
          b_height = bounding_box.height
          b_width = bounding_box.width
          initial_line = 173
          initial_width = 70
          line_diff = 25
          pdf.translate(b_width/2,b_height/2) do
            pdf.rotate 90 do
              pdf.draw_text "#{patient.name}", at: [initial_width,initial_line] 
              pdf.draw_text "#{patient.age}", at: [initial_width + 152,initial_line]
              pdf.draw_text "#{patient.gender}", at: [initial_width + 207,initial_line]
              pdf.draw_text "#{patient.created_at.to_date.strftime('%d-%m-%Y')}", at: [initial_width + 257,initial_line]
              pdf.draw_text "#{patient.father_spouse}", at: [initial_width + 32,initial_line-line_diff]
              pdf.draw_text "#{patient.address}", at: [initial_width + 171 , initial_line-line_diff]
              lower_line_diff = 15
              index = 0
              patient.medical_departments.each do |dept|
                pdf.draw_text "#{dept.medical_department}", at: [ initial_width + 12,initial_line - 4*line_diff - index*lower_line_diff]
                index+=1
              end
            end
          end
        end
      end
    end
  end
end
