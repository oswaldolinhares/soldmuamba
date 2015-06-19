class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :type
      t.string :area
      t.string :address
      t.string :rooms_number
      t.string :parking_number
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
