module LensConfirmationHelper
  include Capybara::DSL

  def confirm_registered_at?
    has_content?(/Registered at\s+#{registered_datetime}/)
  end

  def confirm_mount_name?
    has_content?(/Mount\s+#{mount.name}/)
  end

  def confirm_name?
    has_content?(/Name\s+#{name}/)
  end

  def confirm_mm?
    has_content?(/mm\s+#{mm}/)
  end

  def confirm_f?
    has_content?(/f\s+#{f}/)
  end

  def confirm_close_up?
    has_content?(/Close up\s+#{close_up_state}/)
  end

  def confirm_note?
    has_content?(/Note\s+#{note}/)
  end
end
