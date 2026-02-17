class ChangingHealthColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :logs, :health, :string

    add_column :logs, :attr1, :string
    add_column :logs, :attr1_value, :integer
    add_column :logs, :attr1_memo, :text

    add_column :logs, :attr2, :string
    add_column :logs, :attr2_value, :integer
    add_column :logs, :attr2_memo, :text

    add_column :logs, :attr3, :string
    add_column :logs, :attr3_value, :integer
    add_column :logs, :attr3_memo, :text

    add_column :logs, :attr4, :string
    add_column :logs, :attr4_value, :integer
    add_column :logs, :attr4_memo, :text

    add_column :logs, :attr5, :string
    add_column :logs, :attr5_value, :integer
    add_column :logs, :attr5_memo, :text
  end
end
