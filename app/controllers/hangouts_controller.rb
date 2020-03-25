class HangoutsController < ApplicationController
  before_action :set_hangout, only: :show

  def show
    # raise
  end

  def new
    @hangout = Hangout.new
  end

  def create
    @hangout = Hangout.new(hangout_params)
    @hangout.save
    redirect_to hangout_path(@hangout)
  end

  private

  def set_hangout
    @hangout = Hangout.find(params[:id])
  end

  def hangout_params
    params.require(:hangout).permit(:title, :content)
  end
end
