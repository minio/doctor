class AddTwitterLinkToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :twitter_link, :string
  end
end
