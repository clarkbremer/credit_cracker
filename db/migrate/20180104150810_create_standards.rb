class CreateStandards < ActiveRecord::Migration[5.1]
  def change
    create_table :standards do |t|
      t.string :field
      t.string :code
      t.text :benchmark
      t.text :example

      t.timestamps
    end
  end
end
