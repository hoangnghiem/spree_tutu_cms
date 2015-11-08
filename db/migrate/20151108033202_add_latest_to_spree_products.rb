class AddLatestToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :latest, :boolean, default: false
  end
end
