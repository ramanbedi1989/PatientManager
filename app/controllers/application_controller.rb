class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_medical_camp

  protected
  def check_medical_camp
  	if params[:medical_camp_id]
  		session[:medical_camp_id] = params[:medical_camp_id]
  	end	
  	unless session[:medical_camp_id]
  		redirect_to medical_camps_url
  	end
  end
end
