class AddFontFamilyToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :font_family, :string
  end
end
