class AddSoldedToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :solded, :boolean
  end
end
