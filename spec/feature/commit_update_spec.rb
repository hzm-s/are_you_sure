require 'spec_helper'

feature 'Commit Update' do
  let(:lens) do
    Lens.create(
      registered_at: Time.current,
      mfr_id: MFR.find_by(name: 'Leica').id,
      mount_id: Mount.find_by(name: 'Leica L').id,
      name: 'Summitar',
      mm: 50,
      f: 2.0,
      close_up: false,
      note: '荳ｸ邨槭ｊ'
    )
    LensOnPage.edit
  end

  background do
    lens.name = 'Summicron'
    lens.note = '8 elements'
    lens.confirm
  end

  context 'confirm inputted content' do
    background { lens.update }

    scenario { expect(lens).to have_registered_at }
    scenario { expect(lens).to have_mfr_name }
    scenario { expect(lens).to have_mount_name }
    scenario { expect(lens).to have_name }
    scenario { expect(lens).to have_mm }
    scenario { expect(lens).to have_f }
    scenario { expect(lens).to have_close_up }
    scenario { expect(lens).to have_note }
  end

  context 'cancel inputted content' do
    background { lens.cancel }

    scenario { expect(lens).to have_edit_form }
    scenario { expect(lens).to have_filled_registered_at }
    scenario { expect(lens).to have_filled_mfr_id }
    scenario { expect(lens).to have_filled_mount_id }
    scenario { expect(lens).to have_filled_name }
    scenario { expect(lens).to have_filled_mm }
    scenario { expect(lens).to have_filled_f }
    scenario { expect(lens).to have_filled_close_up }
    scenario { expect(lens).to have_filled_note }
  end

  context 'cancel(by back) inputted content' do
    background { lens.cancel_by_back }

    scenario { expect(lens).to have_edit_form }
    scenario { expect(lens).to have_filled_registered_at }
    scenario { expect(lens).to have_filled_mfr_id }
    scenario { expect(lens).to have_filled_mount_id }
    scenario { expect(lens).to have_filled_name }
    scenario { expect(lens).to have_filled_mm }
    scenario { expect(lens).to have_filled_f }
    scenario { expect(lens).to have_filled_close_up }
    scenario { expect(lens).to have_filled_note }
  end
end
