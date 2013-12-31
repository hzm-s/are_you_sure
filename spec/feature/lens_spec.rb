require 'spec_helper'

class LensSpec < Struct.new(:mfr, :mount, :name, :mm, :f, :close_up, :note); end

feature 'add lens' do
  background do
    visit 'lenses/new'
    select lens.mfr.name, from: 'lens[mfr_id]'
    choose lens.mount.name
    fill_in 'lens[name]', with: lens.name
    fill_in 'lens[mm]', with: lens.mm
    fill_in 'lens[f]', with: lens.f
    fill_in 'lens[note]', with: lens.note
    click_button 'Confirm'
  end

  let(:lens) do
    LensSpec.new(
      MFR.find_by(name: 'Leica'),
      Mount.find_by(name: 'Leica M'),
      'Summilux', 35, 1.4, false, '1st'
    )
  end

  scenario 'see inputted content' do
    expect(page).to have_content(/MFR\s+#{lens.mfr.name}/)
    expect(page).to have_content(/Mount\s+#{lens.mount.name}/)
    expect(page).to have_content(/Name\s+#{lens.name}/)
    expect(page).to have_content(/mm\s+#{lens.mm}/)
    expect(page).to have_content(/f\s+#{lens.f}/)
    expect(page).to have_content(/Close up\s+#{lens.close_up}/)
    expect(page).to have_content(/Note\s+#{lens.note}/)
  end
end
