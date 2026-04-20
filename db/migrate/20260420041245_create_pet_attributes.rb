class CreatePetAttributes < ActiveRecord::Migration[7.1]
  def change
    create_table :pet_attributes do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :attribute_definition, null: false, foreign_key: true
      t.string :icon

      t.timestamps
    end
  end
end
