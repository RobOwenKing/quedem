class DashboardController < ApplicationController
  def show
    @hangouts = current_user.hangouts
    @attending_hangouts = current_user.attendances.map(&:hangout).filter{|hangout| hangout.user != current_user}
  end
end
