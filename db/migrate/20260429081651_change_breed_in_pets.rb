class ChangeBreedInPets < ActiveRecord::Migration[7.1]
  def change
    remove_column :pets, :breed
    add_reference :pets, :breed, foreign_key: true
  end
end
