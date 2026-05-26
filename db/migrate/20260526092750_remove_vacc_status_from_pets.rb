class RemoveVaccStatusFromPets < ActiveRecord::Migration[7.1]
  def change
    remove_column :pets, :vacc_status, :string, array: true, default: []
  end
end
