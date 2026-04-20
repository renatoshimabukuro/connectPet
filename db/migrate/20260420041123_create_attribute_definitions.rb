class CreateAttributeDefinitions < ActiveRecord::Migration[7.1]
  def change
    create_table :attribute_definitions do |t|
      t.string :name, null: false
      t.string :icon
      t.integer :value_type, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :attribute_definitions, [:user_id, :name], unique: true
  end
end
