class AddSidebarLinkColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :sidebar_link_color, :string
  end
end
