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
    params.require(:hangout).permit(:name, :description, location_choices_attributes: [:title, :address, :rating, :photo])
  end
end
