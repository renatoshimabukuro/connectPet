class AddAcceptedToFriendships < ActiveRecord::Migration[7.1]
  def change
    add_column :friendships, :accepted, :boolean, default: false, null: false
  end
end
