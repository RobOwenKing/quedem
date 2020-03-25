class AddDateToDateChoices < ActiveRecord::Migration[5.2]
  def change
    add_column :date_choices, :date, :datetime
  end
end
