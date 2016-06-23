class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.string :link
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :documents, [:category_id, :created_at]
  end
end
