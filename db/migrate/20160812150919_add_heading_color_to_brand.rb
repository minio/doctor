class AddHeadingColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :heading_color, :string, :default => "#5c6267"
  end
end
