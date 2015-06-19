class FixTypeColumnInBuildings < ActiveRecord::Migration
  def self.up
    rename_column :buildings, :type, :building_type
  end
end
