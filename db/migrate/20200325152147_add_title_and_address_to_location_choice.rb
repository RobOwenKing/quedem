class AddTitleAndAddressToLocationChoice < ActiveRecord::Migration[5.2]
  def change
    add_column :location_choices, :title, :string
    add_column :location_choices, :address, :string
    remove_column :location_choices, :location
  end
end
