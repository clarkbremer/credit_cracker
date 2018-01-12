class AddCreditsToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :credits, :decimal
  end
end
