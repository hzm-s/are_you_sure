class LensSpecification < Struct.new(:registered_at, :mfr, :mount, :name, :mm, :f, :close_up, :note)

  def close_up_state
    close_up ? 'available' : 'unavailable'
  end

  def registered_datetime
    registered_at.strftime("%Y-%m-%d %H:%M")
  end

  def registered_year;  registered_at.year;  end
  def registered_month; registered_at.month; end
  def registered_day;   registered_at.day;   end
  def registered_hour;  "%02d" % registered_at.hour;  end
  def registered_min;   "%02d" % registered_at.min;   end
end
