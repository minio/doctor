class AddMenuTitleColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :menu_title_color, :string, :default => "#a2a2a2"
  end
end
