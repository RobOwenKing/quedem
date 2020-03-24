class DateVote < ApplicationRecord
  belongs_to :date_choice
  belongs_to :user
end
