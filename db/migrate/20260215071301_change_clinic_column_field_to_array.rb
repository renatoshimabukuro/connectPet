class ChangeClinicColumnFieldToArray < ActiveRecord::Migration[7.1]
  def change
    remove_column :clinics, :field, :string
    add_column :clinics, :field, :string, array: true, default: []
  end
end
