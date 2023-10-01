class CreateDateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :date_hospitals do |t|
      t.date       :date,             null: false
      t.string     :hospital_name,    null: false
      t.references :user,             null: false, foreign_key: true

      t.timestamps
    end
  end
end
