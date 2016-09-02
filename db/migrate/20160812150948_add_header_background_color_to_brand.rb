class AddHeaderBackgroundColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :header_background_color, :string, :default => "#373d42"
  end
end
