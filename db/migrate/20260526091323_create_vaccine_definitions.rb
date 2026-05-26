class CreateVaccineDefinitions < ActiveRecord::Migration[7.1]
  def change
    create_table :vaccine_definitions do |t|
      t.string :name
      t.references :species, null: false, foreign_key: true
      t.integer :default_duration_days

      t.timestamps
    end
  end
end
