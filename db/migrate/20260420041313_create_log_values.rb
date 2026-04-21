class CreateLogValues < ActiveRecord::Migration[7.1]
  def change
    create_table :log_values do |t|
      t.references :log, null: false, foreign_key: true
      t.references :pet_attribute, null: false, foreign_key: true

      t.boolean :boolean_value
      t.integer :range_value
      t.text :memo

      t.timestamps
    end

    add_index :log_values, [:log_id, :pet_attribute_id],
      unique: true, name: "index_log_values_uniqueness"
  end
end
