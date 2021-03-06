class User < ApplicationRecord
  require 'open-uri'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :location_votes
  has_many :date_votes
  has_many :attendances
  has_many :hangouts
  has_one_attached :photo

  after_create :attach_avatar, unless: Proc.new { self.photo.attached? }

  def attach_avatar
    avatar = URI.open('https://source.unsplash.com/500x500/?avatar')
    self.photo.attach(io: avatar, filename: 'avatar.jpg', content_type: 'image/jpg')
  end

  def has_voted_for(hangout)
    date_votes.any?{ |dv| dv.date_choice.hangout == hangout } || location_votes.any?{ |dv| dv.location_choice.hangout == hangout }
  end

  def voted_for_date?(date)
    date_votes.any?{ |dv| dv.date_choice == date }
  end

  def voted_for_location?(location)
    location_votes.any?{ |lv| lv.location_choice == location }
  end

  def is_going?(hangout)
    attendances.any?{ |rsvp| rsvp.hangout == hangout && rsvp.response == "going" }
  end

  def is_maybe?(hangout)
    attendances.any?{ |rsvp| rsvp.hangout == hangout && rsvp.response == "maybe" }
  end

  def is_no?(hangout)
    attendances.any?{ |rsvp| rsvp.hangout == hangout && rsvp.response == "no" }
  end
end
