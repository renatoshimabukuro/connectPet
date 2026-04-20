class CreatePetAttributes < ActiveRecord::Migration[7.1]
  def change
    create_table :pet_attributes do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :attribute_definition, null: false, foreign_key: true
      t.string :icon

      t.timestamps
    end

    add_index :pet_attributes, [:pet_id, :attribute_definition_id],
      unique: true, name: "index_pet_attributes_uniqueness"
  end
end
