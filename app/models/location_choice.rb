class LocationChoice < ApplicationRecord
  belongs_to :hangout
  has_many :location_votes
end
