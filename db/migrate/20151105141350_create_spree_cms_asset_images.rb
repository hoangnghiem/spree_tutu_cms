class CreateSpreeCmsAssetImages < ActiveRecord::Migration
  def change
    create_table :spree_cms_asset_images do |t|
      t.attachment :photo

      t.timestamps null: false
    end
  end
end
