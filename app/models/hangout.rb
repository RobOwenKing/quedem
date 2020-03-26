class Hangout < ApplicationRecord
  belongs_to :user
  has_many :date_choices
  has_many :location_choices
    accepts_nested_attributes_for :location_choices, reject_if: :all_blank, allow_destroy: true
end
