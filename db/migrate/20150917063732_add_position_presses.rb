class AddPositionPresses < ActiveRecord::Migration
  def change
    add_column :spree_presses, :position, :integer
  end
end
