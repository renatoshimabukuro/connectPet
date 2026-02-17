class AddingAttributesToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :attr1, :string
    add_column :pets, :attr2, :string
    add_column :pets, :attr3, :string
    add_column :pets, :attr4, :string
    add_column :pets, :attr5, :string
  end
end
