class AddUniqueIndexToDocument < ActiveRecord::Migration
  def change
    add_index :documents, [:name, :category_id], unique: true
  end
end
