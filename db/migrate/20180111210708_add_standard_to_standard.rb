class AddStandardToStandard < ActiveRecord::Migration[5.1]
  def change
    rename_column :standards, :example, :standard
  end
end
