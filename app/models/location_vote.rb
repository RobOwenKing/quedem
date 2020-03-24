class LocationVote < ApplicationRecord
  belongs_to :location_choice
  belongs_to :user
end
