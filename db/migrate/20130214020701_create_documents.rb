class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.datetime :datemodified
      t.timestamps
    end
  end
end
