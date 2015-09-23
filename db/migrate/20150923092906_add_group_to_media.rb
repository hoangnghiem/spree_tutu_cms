class AddGroupToMedia < ActiveRecord::Migration
  def change
    add_column :spree_blog_media, :group_id, :integer, index: true
  end
end
