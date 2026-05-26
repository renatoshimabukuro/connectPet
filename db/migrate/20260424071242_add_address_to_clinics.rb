class AddAddressToClinics < ActiveRecord::Migration[7.1]
  def change
    add_column :clinics, :address, :string
  end
end
