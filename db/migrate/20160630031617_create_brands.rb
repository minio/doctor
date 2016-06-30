class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title
      t.string :logo_url
      t.string :tagline
      t.string :home_link
      t.string :github_link
      t.string :gitter_link
      t.string :footer_text
      t.string :footer_img
      t.string :footer_chatlink

      t.timestamps null: false
    end
  end
end
