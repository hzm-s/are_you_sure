module LensFormHelper
  include Capybara::DSL

  def confirm
    if registered_at
      select registered_at.year,          from: 'lens[registered_at(1i)]'
      select registered_at.month,         from: 'lens[registered_at(2i)]'
      select registered_at.day,           from: 'lens[registered_at(3i)]'
      select "%02d" % registered_at.hour, from: 'lens[registered_at(4i)]'
      select "%02d" % registered_at.min,  from: 'lens[registered_at(5i)]'
    end
    select mfr.name, from: 'lens[mfr_id]' if mfr
    choose mount.name if mount
    fill_in 'lens[name]', with: name
    fill_in 'lens[mm]',   with: mm
    fill_in 'lens[f]',    with: f
    fill_in 'lens[note]', with: note
    click_button '確認画面へ'
  end

  def has_error_on?(name)
    all('li').collect {|li| li.text }.any? {|t| t =~ /#{name}/i }
  end

  def has_new_form?
    has_css?('form#new_lens')
  end

  def has_edit_form?
    has_css?("form#edit_lens_#{id}")
  end

  def create
    click_button '作成する'
  end

  def update
    click_button '変更する'
  end

  def cancel
    click_link '戻る'
  end

  def has_filled_registered_at?
    find('#lens_registered_at_1i').value == registered_at.year.to_s &&
    find('#lens_registered_at_2i').value == registered_at.month.to_s &&
    find('#lens_registered_at_3i').value == registered_at.day.to_s &&
    find('#lens_registered_at_4i').value == "%02d" % registered_at.hour.to_s &&
    find('#lens_registered_at_5i').value == "%02d" % registered_at.min.to_s
  end

  def has_filled_mfr_id?
    find('#lens_mfr_id').value == mfr.id.to_s
  end

  def has_filled_mount_id?
    find("#lens_mount_id_#{mount.id}")[:checked] == 'checked'
  end

  def has_filled_name?
    find('#lens_name').value == name
  end

  def has_filled_mm?
    find('#lens_mm').value == mm.to_s
  end

  def has_filled_f?
    find('#lens_f').value == f.to_s
  end

  def has_filled_close_up?
    find('#lens_close_up')[:checked] == close_up ? 'checked' : ''
  end

  def has_filled_note?
    find('#lens_note').value == note
  end
end
