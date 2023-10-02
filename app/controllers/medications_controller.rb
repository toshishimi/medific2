class MedicationsController < ApplicationController
  before_action :find_date_hospital
  before_action :find_medication, only: [:edit, :update]

  def show
    @medications = @date_hospital.medications
  end

  def edit
    @total_info = TotalInfo.new(
      date: @date_hospital.date,
      hospital_name: @date_hospital.hospital_name,
      medicine_name: @medication.medicine_name,
      timing: @medication.timing,
      individual: @medication.individual,
      days_supply: @medication.days_supply,
      notes: @medication.notes
    )
  end

  def update
    @total_info = TotalInfo.new(total_info_params)
    if @total_info.valid?
      @date_hospital.update(
        date: @total_info.date,
        hospital_name: @total_info.hospital_name
      )
      @medication.update(
        medicine_name: @total_info.medicine_name,
        timing: @total_info.timing,
        individual: @total_info.individual,
        days_supply: @total_info.days_supply,
        notes: @total_info.notes
      )

      redirect_to date_hospital_medication_path(@date_hospital)
    else
      render :edit
    end
  end

  private

  def find_date_hospital
    @date_hospital = DateHospital.find(params[:date_hospital_id])
  end

  def find_medication
    @medication = Medication.find(params[:id])
  end

  def total_info_params
    params.require(:total_info)
    .permit(:date, :hospital_name, :medicine_name, :timing, :individual, :days_supply, :notes)
    .merge(user_id: current_user.id)
  end
end
