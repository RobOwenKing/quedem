class DateChoicesController < ApplicationController
  def create
    @date_choice = DateChoice.new(date_choice_params)
    @hangout = Hangout.find(params[:hangout_id])

    @date_choice.hangout = @hangout
    @date_choice.save

    # redirect_to hangout_path(@hangout)
  end

  private

  def date_choice_params
    # params.require(:date_choice).permit( ??? )
  end
end
