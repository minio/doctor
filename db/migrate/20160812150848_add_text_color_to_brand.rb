class AddTextColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :text_color, :string, :default => "#7c8287"
  end
end
