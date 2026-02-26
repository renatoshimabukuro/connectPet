class AddArchivedToChats < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :archived, :boolean
  end
end
