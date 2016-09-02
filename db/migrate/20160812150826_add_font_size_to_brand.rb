class AddFontSizeToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :font_size, :string, :default => "16px"
  end
end
