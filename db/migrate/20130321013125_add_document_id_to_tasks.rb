class AddDocumentIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :document_id, :integer
  end
end
