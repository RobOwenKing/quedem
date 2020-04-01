module AttendanceHelper
  def rsvp_list(hangout, rsvp)
    list = ""
    hangout.attendances.each do |attend|
      if attend.response == rsvp
        if list == ""
          list = attend.user.name
        else
          list += ", #{attend.user.name}"
        end
      end
    end
    list
  end

  def users_array(hangout, rsvp)
    users = []
    hangout.attendances.each do |attend|
      if attend.response == rsvp
        users << attend.user
      end
    end
    users
  end

  def going_list(hangout)
    # rsvp_list(hangout, "going")
    users_array(hangout, "going")
  end

  def maybe_list(hangout)
    # rsvp_list(hangout, "maybe")
    users_array(hangout, "maybe")
  end

  def no_list(hangout)
    # rsvp_list(hangout, "no")
    users_array(hangout, "no")
  end
end
