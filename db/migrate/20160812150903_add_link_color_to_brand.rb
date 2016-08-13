class AddLinkColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :link_color, :string
  end
end
