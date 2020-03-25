class Hangout < ApplicationRecord
  belongs_to :user
  has_many :date_choices
end
