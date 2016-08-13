class AddHeadingColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :heading_color, :string
  end
end
