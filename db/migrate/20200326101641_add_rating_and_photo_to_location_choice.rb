class AddRatingAndPhotoToLocationChoice < ActiveRecord::Migration[5.2]
  def change
    add_column :location_choices, :rating, :float
    add_column :location_choices, :photo, :string
  end
end
