class CreateDateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :date_votes do |t|
      t.references :date_choice, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
