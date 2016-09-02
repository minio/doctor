class AddHeaderTextColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :header_text_color, :string, :default => "#000000"
  end
end
