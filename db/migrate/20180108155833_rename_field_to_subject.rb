class RenameFieldToSubject < ActiveRecord::Migration[5.1]
  def change
    rename_column :standards, :field, :subject
  end
end
