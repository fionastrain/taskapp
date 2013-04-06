class AddTeammateIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :teammate_id, :integer
  end
end
