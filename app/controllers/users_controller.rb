class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create, :update ]

  def create
    user = User.create(name: params[:user][:name], password: params[:user][:password], email: params[:user][:email], photo: params[:user][:photo] )
    hangout = params[:hangout_id]

    process_vote_details(user, hangout)

    flash.notice("Your votes have been saved")
  end

  def update
    user = current_user
    hangout = params[:user][:hangout_id]

    process_vote_details(user, hangout)

    redirect_to hangout_path(hangout), notice: "Your votes have been saved"
  end

  private

  def process_vote_details(user, hangout)
    # Delete all user's old date votes
    user_votes = DateVote.where(user: user)
    relevant_votes = user_votes.select { |dv| dv.date_choice.hangout_id == hangout.to_i }
    relevant_votes.each { |dv| dv.delete }

    # Delete all user's old location votes
    user_votes = LocationVote.where(user: user)
    relevant_votes = user_votes.select { |lv| lv.location_choice.hangout_id == hangout.to_i }
    relevant_votes.each { |lv| lv.delete }

    # Delete user's old attendance
    user_attendance = Attendance.where(user: user)
    relevant_votes = user_attendance.select { |attend| attend.hangout_id == hangout.to_i }
    relevant_votes.each { |attend| attend.delete }

    dates = params[:date_votes]
    dates.split(",").each do |date|
      DateVote.create(date_choice_id: date, user: user)
    end

    locations = params[:location_votes]
    locations.split(",").each do |location|
      LocationVote.create(location_choice_id: location, user: user)
    end

    rsvp = params[:attendance]
    Attendance.create(user: user, hangout_id: hangout, response: rsvp )
    @hangout = Hangout.find(hangout)
    UserMailer.with(user: @hangout.user, hangout: @hangout, voter: current_user).vote_casted.deliver_now
  end
end
