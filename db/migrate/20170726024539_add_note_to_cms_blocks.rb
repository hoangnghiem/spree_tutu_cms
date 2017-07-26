class AddNoteToCmsBlocks < ActiveRecord::Migration
  def change
    add_column :spree_cms_blocks, :note, :text
  end
end
