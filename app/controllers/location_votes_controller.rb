class LocationVotesController < ApplicationController
  before_action :set_location_vote, only: :destroy

  def create
    @location_vote = LocationVote.new(location_vote_params)
    @location_choice = LocationChoice.find(params[:location_choice_id])

    @location_vote.location_choice = @location_choice
    @location_vote.save

    redirect_to location_choice_path(@location_choice)
  end

  def destroy
    @location_vote.destroy

    redirect_to location_votes_path
  end

  private

  def set_location_vote
    @location_vote = LocationVote.find(params[:id])
  end

  def location_vote_params
    # params.require(:location_vote).permit( ??? )
  end
end

