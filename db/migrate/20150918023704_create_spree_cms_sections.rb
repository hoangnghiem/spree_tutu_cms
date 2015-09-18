class CreateSpreeCmsSections < ActiveRecord::Migration
  def change
    create_table :spree_cms_sections do |t|
      t.references :layout, index: true, foreign_key: true
      t.string :name
      t.string :key

      t.timestamps null: false
    end
  end
end