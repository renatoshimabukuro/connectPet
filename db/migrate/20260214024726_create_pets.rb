class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :dob
      t.string :species
      t.string :breed
      t.string :microchip
      t.float :weight
      t.string :current_meds
      t.string :vacc_status
      t.text :notes

      t.timestamps
    end
  end
end
