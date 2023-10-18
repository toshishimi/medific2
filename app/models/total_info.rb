class TotalInfo
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment

  attr_accessor :date, :hospital_name, :user_id, :medicine_name, :timing, :individual, :days_supply, :notes, :medications

  with_options presence: true do
    validates :date
    validates :hospital_name
    validates :user_id
  end

  validate :validate_medications


  def validate_medications
    if medications.present?
      medications.each_with_index do |medication, index|
        unless medication["medicine_name"].present?
          errors.add("#{index + 1}の薬名", "を入力してください")
        end
      end
    end
  end


  def initialize(attributes = {})
    super
    @medications = attributes[:medications] || [] # medications属性を初期化
  end
  

  def add_medication(medication_info)
    @medications << medication_info
  end
 

  def save
    date_hospital = DateHospital.create(date: date, hospital_name: hospital_name, user_id: user_id)
    @medications.each do |medication_info|
      Medication.create(
        medicine_name: medication_info[:medicine_name],
        timing: medication_info[:timing],
        individual: medication_info[:individual],
        days_supply: medication_info[:days_supply],
        notes: medication_info[:notes],
        date_hospital_id: date_hospital.id
      )
    end
  end
  
end