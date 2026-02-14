class CreateClinics < ActiveRecord::Migration[7.1]
  def change
    create_table :clinics do |t|
      t.string :field
      t.string :clinic_name
      t.string :contact
      t.string :species

      t.timestamps
    end
  end
end
