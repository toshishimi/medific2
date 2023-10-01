class TotalInfo
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment

  attr_accessor :date, :hospital_name, :user_id, :medicine_name, :timing, :individual, :days_supply, :notes

  with_options presence: true do
    validates :date
    validates :hospital_name
    validates :medicine_name
    validates :user_id
  end

   
  def save
    date_hospital = DateHospital.create(date: date, hospital_name: hospital_name, user_id: user_id)
    Medication.create(
      medicine_name: medicine_name, timing: timing, individual: individual, days_supply: days_supply, notes: notes, date_hospital_id: date_hospital.id
    )
  end
  
end