class AddDocumentUrlToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :DocumentURL, :string
  end
end
