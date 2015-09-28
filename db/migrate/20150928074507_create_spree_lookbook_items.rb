class CreateSpreeLookbookItems < ActiveRecord::Migration
  def change
    create_table :spree_lookbook_items do |t|
      t.references :lookbook, index: true, foreign_key: true
      t.attachment :image
      t.integer :group_id
      t.integer :position

      t.timestamps null: false
    end
  end
end
