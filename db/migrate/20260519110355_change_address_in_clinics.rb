class ChangeAddressInClinics < ActiveRecord::Migration[7.1]
  def change
    # remove_column :clinics, :address, :string
    add_column :clinics, :address, :string, default: "", null: false
  end
end
