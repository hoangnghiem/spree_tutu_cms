class CreateSpreeCmsPages < ActiveRecord::Migration
  def change
    create_table :spree_cms_pages do |t|
      t.string :title
      t.string :url
      t.boolean :enabled, default: true
      t.text :content
      t.string :meta_keywords
      t.string :meta_description

      t.timestamps null: false
    end
  end
end
