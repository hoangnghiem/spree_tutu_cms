class AddPositionToMedia < ActiveRecord::Migration
  def change
    add_column :spree_blog_media, :position, :integer
  end
end
