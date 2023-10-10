class MedicationsController < ApplicationController
  before_action :find_date_hospital
  before_action :find_medication

  def show
  end

  def edit
    @total_info = TotalInfo.new(
      date: @date_hospital.date,
      hospital_name: @date_hospital.hospital_name,
      medications: @medications.map do |medication|
        {
          medicine_name: medication.medicine_name,
          timing: medication.timing,
          individual: medication.individual,
          days_supply: medication.days_supply,
          notes: medication.notes
        }
      end
    )
  end

  def update
    @total_info = TotalInfo.new(total_info_params)
    if @total_info.valid?
      @date_hospital.update(
        date: @total_info.date,
        hospital_name: @total_info.hospital_name
      )
      @medications.each_with_index do |medication, index|
        medication.update(
          medicine_name: @total_info.medications[index][:medicine_name],
          timing: @total_info.medications[index][:timing],
          individual: @total_info.medications[index][:individual],
          days_supply: @total_info.medications[index][:days_supply],
          notes: @total_info.medications[index][:notes]
        )
      end  

      # 新しい薬を追加
      @total_info.medications.drop(@medications.size).each do |new_medication|
        Medication.create(
          medicine_name: new_medication[:medicine_name],
          timing: new_medication[:timing],
          individual: new_medication[:individual],
          days_supply: new_medication[:days_supply],
          notes: new_medication[:notes],
          date_hospital_id: @date_hospital.id
        )
      end
      redirect_to date_hospital_medication_path(@date_hospital)
    else
      render :edit
    end
  end

  def destroy
    binding.pry
    medication = Medication.find(params[:id])
      if @date_hospital.user_id == current_user.id
        medication.destroy
      end
    redirect_to edit_date_hospital_medication_path(@date_hospital, date_hospital_id: @date_hospital.id)
  end

  
  private

  def find_date_hospital
    @date_hospital = DateHospital.find(params[:date_hospital_id])
  end

  def find_medication
    @medications = @date_hospital.medications
  end

  def total_info_params
    params.require(:total_info).permit(
      :date, :hospital_name, :user_id,
      medications: [:medicine_name, :timing, :individual, :days_supply, :notes]
    ).merge(user_id: current_user.id)
  end
  
end
