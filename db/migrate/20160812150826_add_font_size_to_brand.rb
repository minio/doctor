class AddFontSizeToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :font_size, :string
  end
end
