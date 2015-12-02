class AddFieldsToPages < ActiveRecord::Migration
  def change
    add_column :spree_cms_pages, :footer_link, :boolean, default: true
    add_column :spree_cms_pages, :position, :integer, default: 0
  end
end
