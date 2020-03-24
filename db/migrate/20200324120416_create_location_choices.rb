class CreateLocationChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :location_choices do |t|
      t.references :hangout, foreign_key: true

      t.timestamps
    end
  end
end
