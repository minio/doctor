class AddSearchtokenToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :searchtoken, :string
  end
end
