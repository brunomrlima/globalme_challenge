class CreateTaskGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :task_groups do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.references :task, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
