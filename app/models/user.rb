class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name,        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :name_kana,   format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  
  has_many :date_hospitals
end
