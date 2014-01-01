require 'spec_helper'

feature 'Confirm' do
  context 'input valid attributes' do
    background do
      @lens = LensOnPage.new(
        Time.current,
        MFR.find_by(name: 'Leica'),
        Mount.find_by(name: 'Leica M'),
        'Summilux', 35, 1.4, false, '1st'
      )
      @lens.confirm
    end

    scenario { expect(@lens).to be_registered_at_confirmed }
    scenario { expect(@lens).to be_mount_name_confirmed }
    scenario { expect(@lens).to be_name_confirmed }
    scenario { expect(@lens).to be_mm_confirmed }
    scenario { expect(@lens).to be_f_confirmed }
    scenario { expect(@lens).to be_close_up_confirmed }
    scenario { expect(@lens).to be_note_confirmed }
  end
end
