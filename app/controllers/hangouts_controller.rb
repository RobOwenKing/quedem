class HangoutsController < ApplicationController
  before_action :set_hangout, only: :show

  def show
    # raise
  end

  def new
    @hangout = Hangout.new
    @hangout.location_choices.build
  end

  def create
    @hangout = Hangout.new(hangout_params)
    @hangout.user = current_user
    if @hangout.save

    params[:date_choices].split(",").each do |dc|
      DateChoice.create(date: DateTime.new(dc.to_i), hangout_id: @hangout.id)
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
    params.require(:hangout).permit(:name, :description, :choices, location_choices_attributes: [:title, :address])
  end
end
