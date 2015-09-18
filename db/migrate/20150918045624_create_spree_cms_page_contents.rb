class CreateSpreeCmsPageContents < ActiveRecord::Migration
  def change
    create_table :spree_cms_page_contents do |t|
      t.references :page, index: true, foreign_key: true
      t.references :section, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
