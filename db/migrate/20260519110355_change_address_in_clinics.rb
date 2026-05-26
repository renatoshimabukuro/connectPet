class ChangeAddressInClinics < ActiveRecord::Migration[7.1]
  def change
    add_column :clinics, :address, :string, default: "", null: false
  end
end
