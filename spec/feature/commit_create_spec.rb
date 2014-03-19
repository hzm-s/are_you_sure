require 'spec_helper'

feature 'Commit Create' do
  let(:lens) do
    LensOnPage.new(
      Time.current,
      MFR.find_by(name: 'Leica'),
      Mount.find_by(name: 'Leica M'),
      'Summilux', 35, 1.4, false, '1st'
    )
  end

  context 'confirm inputted content' do
    background do
      lens.confirm
      lens.create
    end

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
    background do
      lens.confirm
      lens.cancel
    end

    scenario { expect(lens).to have_new_form }
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
    background do
      lens.confirm
      lens.cancel_by_back
    end

    scenario { expect(lens).to have_new_form }
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
