class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :brand
      t.string :year
      t.string :km
      t.text :description
      t.text :description_vehicle
      t.references :user, index: true

      t.timestamps
    end
  end
end
