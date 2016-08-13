class AddHeaderBackgroundColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :header_background_color, :string
  end
end
