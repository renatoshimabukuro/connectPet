class ChangeAddressInClinics < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:clinics, :address)
      add_column :clinics, :address, :string, default: "", null: false
    else
      change_column_null :clinics, :address, false, ""
      change_column_default :clinics, :address, ""
    end
  end
end
