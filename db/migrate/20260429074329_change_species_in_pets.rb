class ChangeSpeciesInPets < ActiveRecord::Migration[7.1]
  def change
    remove_column :pets, :species
    add_reference :pets, :species, foreign_key: true
  end
end
