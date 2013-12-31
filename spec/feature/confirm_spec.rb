require 'spec_helper'

feature 'confirm lens' do
  scenario 'see inputted content' do
    lens = LensOnPage.new(
      Time.current,
      MFR.find_by(name: 'Leica'),
      Mount.find_by(name: 'Leica M'),
      'Summilux', 35, 1.4, false, '1st'
    )
    lens.confirm
    expect(lens).to be_confirm_registered_at
    expect(lens).to be_confirm_mount_name
    expect(lens).to be_confirm_name
    expect(lens).to be_confirm_mm
    expect(lens).to be_confirm_f
    expect(lens).to be_confirm_close_up
    expect(lens).to be_confirm_note
  end
end
