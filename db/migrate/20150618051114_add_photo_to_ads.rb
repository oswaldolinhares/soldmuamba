class AddPhotoToAds < ActiveRecord::Migration
  def change
    add_column :ads, :photo, :string
  end
end
