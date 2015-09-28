class CreateSpreeLookbooks < ActiveRecord::Migration
  def change
    create_table :spree_lookbooks do |t|
      t.string :name
      t.string :slug
      t.string :publish_date
      t.attachment :featured_image
      t.boolean :enabled, default: true

      t.timestamps null: false
    end
  end
end
