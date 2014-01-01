module LensConfirmationHelper
  include Capybara::DSL

  def has_confirm_message?
    has_content?(/この内容でよろしいですか\?/)
  end

  def has_registered_at?
    has_content?(/Registered at\s+#{registered_datetime}/)
  end

  def has_mfr_name?
    has_content?(/MFR\s#{mfr.name}/)
  end

  def has_mount_name?
    has_content?(/Mount\s+#{mount.name}/)
  end

  def has_name?
    has_content?(/Name\s+#{name}/)
  end

  def has_mm?
    has_content?(/mm\s+#{mm}/)
  end

  def has_f?
    has_content?(/f\s+#{f}/)
  end

  def has_close_up?
    has_content?(/Close up\s+#{close_up_state}/)
  end

  def has_note?
    has_content?(/Note\s+#{note}/)
  end
end
