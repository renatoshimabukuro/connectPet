class ChangeArchivedFromChats < ActiveRecord::Migration[7.1]
  def change
    change_column :chats, :archived, :boolean, default: false, null: false
  end
end
