class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.float :price
      t.references :user, index: true
      t.references :vehicle, index: true
      t.references :building, index: true
      t.timestamps
    end
  end
end
