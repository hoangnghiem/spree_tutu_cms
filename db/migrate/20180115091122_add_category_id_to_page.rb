class AddCategoryIdToPage < ActiveRecord::Migration
  def change
    add_column :spree_cms_pages, :category_id, :integer
  end
end
