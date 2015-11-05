class CreateSpreeCmsBlocks < ActiveRecord::Migration
  def change
    create_table :spree_cms_blocks do |t|
      t.string :name
      t.text :template

      t.timestamps null: false
    end
  end
end
