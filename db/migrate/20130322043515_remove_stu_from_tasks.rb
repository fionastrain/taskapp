class RemoveStuFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :completed
  end

  def down
    add_column :tasks, :completed, :boolean
  end
end
