module LensInputtable
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
end
