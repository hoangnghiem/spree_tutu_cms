class CreateSpreeCmsCategories < ActiveRecord::Migration
  def change
    create_table :spree_cms_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
