class AddHeaderTextColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :header_text_color, :string
  end
end
