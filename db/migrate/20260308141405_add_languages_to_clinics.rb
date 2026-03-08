class AddLanguagesToClinics < ActiveRecord::Migration[7.1]
  def change
    add_column :clinics, :languages, :string, array: true, default: []
  end
end
