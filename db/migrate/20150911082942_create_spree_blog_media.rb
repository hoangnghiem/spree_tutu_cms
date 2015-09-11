class CreateSpreeBlogMedia < ActiveRecord::Migration
  def change
    create_table :spree_blog_media do |t|
      t.string :name
      t.string :url
      t.attachment :file
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
