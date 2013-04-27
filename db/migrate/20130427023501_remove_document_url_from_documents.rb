class RemoveDocumentUrlFromDocuments < ActiveRecord::Migration
  def up
    remove_column :documents, :DocumentURL
  end

  def down
    add_column :documents, :DocumentURL, :string
  end
end
