class CreateSpreeCmsAssetRichtexts < ActiveRecord::Migration
  def change
    create_table :spree_cms_asset_richtexts do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
