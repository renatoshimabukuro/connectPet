class RemoveAttrsFromPets < ActiveRecord::Migration[7.1]
  def change
    remove_column :pets, :attr1, :string
    remove_column :pets, :attr2, :string
    remove_column :pets, :attr3, :string
    remove_column :pets, :attr4, :string
    remove_column :pets, :attr5, :string
  end
end
