class AddPublishDateToPost < ActiveRecord::Migration
  def change
    add_column :spree_blog_posts, :publish_date, :date
  end
end
