module LensConfirmationHelper
  include Capybara::DSL

  def has_confirm_message?
    has_content?(/この内容でよろしいですか\?/)
  end

  def has_registered_at_confirmation?
    has_content?(/Registered at\s+#{registered_datetime}/)
  end

  def has_mfr_name_confirmation?
    has_content?(/MFR\s#{mfr.name}/)
  end

  def has_mount_name_confirmation?
    has_content?(/Mount\s+#{mount.name}/)
  end

  def has_name_confirmation?
    has_content?(/Name\s+#{name}/)
  end

  def has_mm_confirmation?
    has_content?(/mm\s+#{mm}/)
  end

  def has_f_confirmation?
    has_content?(/f\s+#{f}/)
  end

  def has_close_up_confirmation?
    has_content?(/Close up\s+#{close_up_state}/)
  end

  def has_note_confirmation?
    has_content?(/Note\s+#{note}/)
  end
end
