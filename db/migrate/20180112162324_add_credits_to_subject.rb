class AddCreditsToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :credits, :decimal, precision: 6, scale: 3
  end
end
