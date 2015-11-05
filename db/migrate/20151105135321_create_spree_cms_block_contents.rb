class CreateSpreeCmsBlockContents < ActiveRecord::Migration
  def change
    create_table :spree_cms_block_contents do |t|
      t.references :block, index: true, foreign_key: true
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
