class AddSlugToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :slug, :string
    add_index :documents, :slug
  end
end
