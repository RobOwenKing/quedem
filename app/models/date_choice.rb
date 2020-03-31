class DateChoice < ApplicationRecord
  belongs_to :hangout
  has_many :date_votes
end
