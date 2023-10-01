class DateHospital < ApplicationRecord
  belongs_to :user
  has_many :medications
end
