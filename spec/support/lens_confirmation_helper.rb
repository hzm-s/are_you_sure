module LensConfirmationHelper
  include Capybara::DSL

  def registered_at_confirmed?
    has_content?(/Registered at\s+#{registered_datetime}/)
  end

  def mfr_name_confirmed?
    has_content?(/MFR\s#{mfr.name}/)
  end

  def mount_name_confirmed?
    has_content?(/Mount\s+#{mount.name}/)
  end

  def name_confirmed?
    has_content?(/Name\s+#{name}/)
  end

  def mm_confirmed?
    has_content?(/mm\s+#{mm}/)
  end

  def f_confirmed?
    has_content?(/f\s+#{f}/)
  end

  def close_up_confirmed?
    has_content?(/Close up\s+#{close_up_state}/)
  end

  def note_confirmed?
    has_content?(/Note\s+#{note}/)
  end
end
