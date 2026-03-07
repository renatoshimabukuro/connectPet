class ChangePetIdInChat < ActiveRecord::Migration[7.1]
  def change
    remove_reference :chats, :pet, index: true, foreign_key: true
    add_reference :chats, :pet, index: true, foreign_key: true
  end
end
