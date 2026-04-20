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
  end
end
