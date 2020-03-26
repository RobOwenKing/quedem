class DashboardController < ApplicationController
  def show
    @hangouts = current_user.hangouts
  end
end
