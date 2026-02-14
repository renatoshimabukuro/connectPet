class AddColumnsToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :insurance, :string
    add_column :pets, :fixed, :boolean
    add_column :pets, :gender, :string
  end
end
