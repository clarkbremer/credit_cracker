class AddSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
    end

    remove_column :standards, :subject, :string
    add_column :standards, :subject_id, :integer
  end
end
