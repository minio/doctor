class AddSlackLinkToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :slack_link, :string
  end
end
