class ChangeClinicSpeciesFieldToArray < ActiveRecord::Migration[7.1]
  def change
    remove_column :clinics, :species, :string
    add_column :clinics, :species, :string, array: true, default: []
  end
end
