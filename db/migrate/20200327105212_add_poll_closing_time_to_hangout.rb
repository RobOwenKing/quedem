class AddPollClosingTimeToHangout < ActiveRecord::Migration[5.2]
  def change
    add_column :hangouts, :poll_closing_time, :datetime
  end
end
