class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.references :vet, foreign_key: { to_table: :users }
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
