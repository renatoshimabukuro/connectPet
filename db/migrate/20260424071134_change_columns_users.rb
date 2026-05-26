class ChangeColumnsUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :address, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
  end
end
