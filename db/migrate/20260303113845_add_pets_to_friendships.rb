class AddPetsToFriendships < ActiveRecord::Migration[7.1]
  def change
    add_reference :friendships, :pet, foreign_key: true, null: false
  end
end
