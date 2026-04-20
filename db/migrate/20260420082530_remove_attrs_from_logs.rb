class RemoveAttrsFromLogs < ActiveRecord::Migration[7.1]
  def change
    remove_column :logs, :attr1, :string
    remove_column :logs, :attr1_value, :integer
    remove_column :logs, :attr1_memo, :text
    remove_column :logs, :attr2, :string
    remove_column :logs, :attr2_value, :integer
    remove_column :logs, :attr2_memo, :text
    remove_column :logs, :attr3, :string
    remove_column :logs, :attr3_value, :integer
    remove_column :logs, :attr3_memo, :text
    remove_column :logs, :attr4, :string
    remove_column :logs, :attr4_value, :integer
    remove_column :logs, :attr4_memo, :text
    remove_column :logs, :attr5, :string
    remove_column :logs, :attr5_value, :integer
    remove_column :logs, :attr5_memo, :text
  end
end
