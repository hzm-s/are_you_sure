require 'spec_helper'

feature 'Confirm Create' do
  context 'Input valid attributes' do
    background do
      @lens = LensOnPage.new(
        Time.current,
        MFR.find_by(name: 'Leica'),
        Mount.find_by(name: 'Leica M'),
        'Summilux', 35, 1.4, false, '1st'
      )
      @lens.confirm
    end

    scenario { expect(@lens).to have_confirm_message }
    scenario { expect(@lens).to have_registered_at }
    scenario { expect(@lens).to have_mfr_name }
    scenario { expect(@lens).to have_mount_name }
    scenario { expect(@lens).to have_name }
    scenario { expect(@lens).to have_mm }
    scenario { expect(@lens).to have_f }
    scenario { expect(@lens).to have_close_up }
    scenario { expect(@lens).to have_note }
  end

  context 'Input invalid attributes' do
    background do
      @lens = LensOnPage.new
      @lens.confirm
    end

    scenario { expect(@lens).to have_new_form }
    scenario { expect(@lens).to have_error_on(:mount) }
    scenario { expect(@lens).to have_error_on(:name) }
    scenario { expect(@lens).to have_error_on(:mm) }
    scenario { expect(@lens).to have_error_on(:f) }
    scenario { expect(@lens).to have_error_on(:note) }
  end
end
