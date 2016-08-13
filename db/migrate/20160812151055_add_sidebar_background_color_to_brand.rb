class AddSidebarBackgroundColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :sidebar_background_color, :string
  end
end
