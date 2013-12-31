class LensOnPage < Struct.new(:registered_at, :mfr, :mount, :name, :mm, :f, :close_up, :note)
  include LensInputtable
  include LensConfirmationHelper

  def registered_datetime
    registered_at.strftime("%Y-%m-%d %H:%M")
  end

  def close_up_state
    close_up ? 'available' : 'unavailable'
  end
end
