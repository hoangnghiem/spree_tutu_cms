class AddLayoutToPage < ActiveRecord::Migration
  def change
    add_column :spree_cms_pages, :layout_id, :integer, index: true
  end
end
