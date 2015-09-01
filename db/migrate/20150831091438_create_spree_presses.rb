class CreateSpreePresses < ActiveRecord::Migration
  def change
    create_table :spree_presses do |t|
      t.string :title
      t.boolean :enabled, default: true
      t.attachment :poster

      t.timestamps null: false
    end
  end
end
