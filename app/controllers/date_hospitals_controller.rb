class DateHospitalsController < ApplicationController
  def index
    @date_hospitals = DateHospital.includes(:user).order('date DESC, hospital_name')
  end

  def new
    @total_info = TotalInfo.new
  end

  def create
    @total_info = TotalInfo.new(total_info_params)
    if @total_info.valid?
      @total_info.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    date_hospital = DateHospital.find(params[:id])
    if date_hospital.user_id == current_user.id
      date_hospital.destroy
    end
    redirect_to root_path  
  end
 
  private

  def total_info_params
    params.require(:total_info)
    .permit(:date, :hospital_name, :medicine_name, :timing, :individual, :days_supply, :notes)
    .merge(user_id: current_user.id)
  end

end
