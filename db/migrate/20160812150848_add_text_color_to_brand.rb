class AddTextColorToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :text_color, :string
  end
end
