class CreateSpreeBlogPosts < ActiveRecord::Migration
  def change
    create_table :spree_blog_posts do |t|
      t.string :title
      t.string :slug
      t.attachment :featured_image
      t.text :short_content
      t.text :content
      t.boolean :enabled, default: false
      t.timestamps null: false
    end
  end
end
