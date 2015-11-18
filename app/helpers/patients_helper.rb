module PatientsHelper
  def format_date(date)
    date.to_time.localtime.strftime('%d/%m/%Y , %I:%M %p')
  end
end
