class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create, :update ]

  def create

    user = User.create(name: params[:user][:name], password: params[:user][:password], email: params[:user][:email] )

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
    user = current_user

    dates = params[:date_votes]
    dates.split(",").each do |date|
      DateVote.create(date_choice_id: date, user: user)
    end

    locations = params[:location_votes]
    locations.split(",").each do |location|
      LocationVote.create(location_choice_id: location, user: user)
    end

    rsvp = params[:attendance]
    Attendance.create(user: user, hangout_id: params[:user][:hangout_id], response: rsvp )
    redirect_to hangout_path(params[:user][:hangout_id])
  end
end
