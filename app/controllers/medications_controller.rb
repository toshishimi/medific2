class MedicationsController < ApplicationController
  def index
  end

  def show
    date_hospital = DateHospital.find(params[:date_hospital_id])
    @medications = date_hospital.medications
  end


 
  
end
