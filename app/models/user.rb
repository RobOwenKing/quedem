class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :location_votes
  has_many :date_votes
  has_many :attendances
  has_many :hangouts

  def has_voted_for(hangout)
    date_votes.any?{ |dv| dv.date_choice.hangout == hangout } || location_votes.any?{ |dv| dv.location_choice.hangout == hangout }
  end
end
