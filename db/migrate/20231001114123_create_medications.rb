class CreateMedications < ActiveRecord::Migration[6.0]
  def change
    create_table :medications do |t|
      t.string     :medicine_name,     null: false
      t.string     :timing      
      t.integer    :individual
      t.integer    :days_supply
      t.text       :notes
      t.references :date_hospital,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
