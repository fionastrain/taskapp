class RemoveTimestampsFromProjectsUsers < ActiveRecord::Migration
  def up
    remove_column :projects_users, :created_at
    remove_column :projects_users, :updated_at
  end

  def down
    add_column :projects_users, :updated_at, :string
    add_column :projects_users, :created_at, :string
  end
end
