class AddMenuHoverBackgroundColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :menu_hover_background_color, :string,  :default => "#ededed"
  end
end
