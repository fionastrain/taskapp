class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.date :duedate
      t.boolean :associated_doc

      t.timestamps
    end
  end
end
