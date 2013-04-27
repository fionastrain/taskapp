class AdddocUrlToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :docurl, :string
  end
end
