class LocationChoicesController < ApplicationController
  def create
    @location_choice = LocationChoice.new(location_choice_params)
    @hangout = Hangout.find(params[:hangout_id])

    @location_choice.hangout = @hangout
    @location_choice.save

    # redirect_to hangout_path(@hangout)
  end

  private

  def location_choice_params
    # params.require(:location_choice).permit( ??? )
  end
end
