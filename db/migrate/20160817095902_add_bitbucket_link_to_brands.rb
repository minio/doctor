class AddBitbucketLinkToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :bitbucket_link, :string
  end
end
