class AddSideContentToPosts < ActiveRecord::Migration
  def change
    add_column :spree_blog_posts, :side_content_title, :string, default: 'Shop The Look'
    add_column :spree_blog_posts, :side_content_link, :string
    add_attachment :spree_blog_posts, :side_content_image
  end
end
