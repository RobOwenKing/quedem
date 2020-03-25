class AddLocationToLocationChoices < ActiveRecord::Migration[5.2]
  def change
    add_column :location_choices, :location, :string
  end
end
