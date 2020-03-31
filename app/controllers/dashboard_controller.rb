class DashboardController < ApplicationController
  def show
    @hangouts = current_user.hangouts
    @attending_hangouts = current_user.attendances.map(&:hangout)
  end
end
