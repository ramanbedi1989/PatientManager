require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
require 'GeneratePDF/generate_pdf'

module RailsAdminPrintPatient
end

module RailsAdmin
  module Config
    module Actions
      class PrintPatient < RailsAdmin::Config::Actions::Base
        register_instance_option :member? do
          true
        end
        register_instance_option :visible? do
          bindings[:object].try(:printable)
        end
        register_instance_option :link_icon do
          'icon-print'
        end
        register_instance_option :pjax? do
          false
        end
        register_instance_option :controller do
          Proc.new do
            @patient_id = @object.id
            GeneratePDF.generate(@patient_id)
            #send_file 'lib/output/new.pdf', type: "application/pdf", x_sendfile: true, disposition: :attachment
            render 'patients/view_pdf'
          end
        end
      end
    end
  end
end