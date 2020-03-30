class HangoutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_hangout, only: :show

  def show
    @user = current_user || User.new
  end

  def new
    @hangout = Hangout.new
    @hangout.location_choices.build
  end

  def create
    @hangout = Hangout.new(hangout_params)
    @hangout.user = current_user
    if @hangout.save
      params[:hangout][:date_choices_attributes].each do |dc|
      DateChoice.create(date: dc.to_datetime, hangout_id: @hangout.id)
    end

      redirect_to hangout_path(@hangout)
    else
      render :new
    end
  end

  private

  def set_hangout
    @hangout = Hangout.find(params[:id])
  end

  def hangout_params
    params.require(:hangout).permit(:name, :description, :choices, :poll_closing_time, location_choices_attributes: [:title, :address, :rating, :photo])
  end
end
