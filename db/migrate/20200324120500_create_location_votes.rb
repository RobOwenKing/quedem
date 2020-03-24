class CreateLocationVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :location_votes do |t|
      t.references :location_choice, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
