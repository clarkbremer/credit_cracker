class JoinModels < ActiveRecord::Migration[5.1]
  def change
    create_table :student_badges do |t|
      t.belongs_to :student, index: true
      t.belongs_to :badge, index: true

      t.timestamps
    end

    create_table :badge_standards do |t|
      t.belongs_to :badge, index: true
      t.belongs_to :standard, index: true

      t.timestamps
    end
  end
end
