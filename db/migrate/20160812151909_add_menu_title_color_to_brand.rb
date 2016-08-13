class AddMenuTitleColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :menu_title_color, :string
  end
end
