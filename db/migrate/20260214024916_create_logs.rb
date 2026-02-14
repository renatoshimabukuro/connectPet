class CreateLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :logs do |t|
      t.references :pet, null: false, foreign_key: true
      t.string :health
      t.date :date

      t.timestamps
    end
  end
end
