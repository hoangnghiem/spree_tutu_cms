class CreateSpreeCmsAssetTexts < ActiveRecord::Migration
  def change
    create_table :spree_cms_asset_texts do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
