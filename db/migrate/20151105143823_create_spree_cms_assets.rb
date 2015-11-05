class CreateSpreeCmsAssets < ActiveRecord::Migration
  def change
    create_table :spree_cms_assets do |t|
      t.references :block_content, index: true
      t.string :asset_type
      t.integer :content_id
      t.string  :content_type

      t.timestamps null: false
    end
  end
end
