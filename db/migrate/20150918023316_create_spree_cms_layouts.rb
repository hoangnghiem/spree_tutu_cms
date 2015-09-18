class CreateSpreeCmsLayouts < ActiveRecord::Migration
  def change
    create_table :spree_cms_layouts do |t|
      t.string :name
      t.text :template

      t.timestamps null: false
    end
  end
end
