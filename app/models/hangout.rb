class Hangout < ApplicationRecord
  belongs_to :user
  has_many :date_choices
  has_many :location_choices
    accepts_nested_attributes_for :location_choices, reject_if: :all_blank, allow_destroy: true

  def location
    location_choices.left_joins(:location_votes).group(:id).order("COUNT(location_votes) DESC").first
  end

  def date
    date_choices.left_joins(:date_votes).group(:id).order("COUNT(date_votes) DESC").first
  end

end
