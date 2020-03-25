class DateVotesController < ApplicationController
  before_action :set_date_vote, only: :destroy

  def create
    @date_vote = DateVote.new(date_vote_params)
    @date_choice = DateChoice.find(params[:date_choice_id])

    @date_vote.date_choice = @date_choice
    @date_vote.save

    # redirect_to date_choice_path(@date_choice)
  end

  def destroy
    @date_vote.destroy

    # redirect_to date_votes_path
  end

  private

  def set_date_vote
    @date_vote = DateVote.find(params[:id])
  end

  def date_vote_params
    # params.require(:date_vote).permit( ??? )
  end
end
