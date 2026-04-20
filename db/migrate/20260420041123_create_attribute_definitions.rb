class CreateAttributeDefinitions < ActiveRecord::Migration[7.1]
  def change
    create_table :attribute_definitions do |t|
      t.string :name
      t.string :icon
      t.integer :value_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
