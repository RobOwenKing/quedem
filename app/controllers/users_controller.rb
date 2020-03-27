class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create, :update ]

  def create
    user = current_user || User.create(name: params[:name], password: params[:password], email: params[:email] )

    dates = params[:date_votes]
    dates.split(",").each do |date|
      DateVote.create(date_choice_id: date, user: user)
    end

    locations = params[:location_votes]
    locations.split(",").each do |location|
      LocationVote.create(location_choice_id: location, user: user)
    end

    rsvp = params[:attendance]
    Attendance.create(user: user, hangout_id: params[:hangout_id], response: rsvp )
  end

  def update
    user = current_user || User.create(name: params[:name], password: params[:password], email: params[:email] )

    dates = params[:date_votes]
    dates.split(",").each do |date|
      DateVote.create(date_choice_id: date, user: user)
    end

    locations = params[:location_votes]
    locations.split(",").each do |location|
      LocationVote.create(location_choice_id: location, user: user)
    end

    rsvp = params[:attendance]
    Attendance.create(user: user, hangout_id: params[:hangout_id], response: rsvp ))
  end
end
