module DateHelper
  # Takes a Time object and returns the three-letter name of the relevant month
  def three_letter_month(date)
    Date::ABBR_MONTHNAMES[date.mon]
  end

  # Takes a Time object and returns the three-letter day of the week
  def three_letter_day(date)
    Date::ABBR_DAYNAMES[date.wday]
  end

  # Takes a Time object and returns the ordinal form of the date
  def date_as_ordinal(date)
    num = date.day.to_s
    if num[-1] > "3" || num [-2] == "1"
      # Any number ending 3, 4, 5... or in the teens ends "th"
      ending = "th"
    else
      # Otherwise, use the last digit as the index of the array of endings
      ending = ["th", "st", "nd", "rd"][num[-1].to_i]
    end
    num + ending
  end
end
