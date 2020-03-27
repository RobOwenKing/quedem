class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create, :update ]

  def create
    user = current_user || User.create(name: params[:name], password: params[:password], email: params[:email] )
    raise
    dates = params[:date_votes]
    dates.split(",").each do |date|
      DateVote.create(date_choice_id: date, user: user)
    end
  end

  def update
    user = current_user || User.create(name: params[:name], password: params[:password], email: params[:email] )
    raise
    dates = params[:date_votes]
    dates.split(",").each do |date|
      DateVote.create(date_choice_id: date, user: user)
    end
  end

  private

  def hangout_params
    params.require(:hangout).permit(:name, :description, location_choices_attributes: [:title, :address])
  end
end
