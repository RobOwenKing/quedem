class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(attendance_params)
    @hangout = Hangout.find(params[:hangout_id])

    @attendance.hangout = @hangout
    @attendance.save

    # redirect_to hangout_path(@hangout)
  end

  def update
    @attendance = Attendance.find(params[:id])
    @attendance.update(attendance_params)

    @attendance.save
  end

  private

  def attendance_params
    # params.require(:attendance).permit( ??? )
  end
end

