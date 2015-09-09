class CreateSpreeCmsImages < ActiveRecord::Migration
  def change
    create_table :spree_cms_images do |t|
      t.attachment :upload

      t.timestamps null: false
    end
  end
end
