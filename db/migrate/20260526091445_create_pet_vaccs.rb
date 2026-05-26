class CreatePetVaccs < ActiveRecord::Migration[7.1]
  def change
    create_table :pet_vaccs do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :vaccine_definition, null: false, foreign_key: true
      t.date :administered_on
      t.date :expires_on
      t.text :notes
      t.datetime :reminder_sent_at

      t.timestamps
    end
  end
end
