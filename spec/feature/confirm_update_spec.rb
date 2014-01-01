require 'spec_helper'

feature 'Confirm Update' do
  background do
    Lens.create(
      registered_at: Time.current,
      mfr_id: MFR.find_by(name: 'Leica').id,
      mount_id: Mount.find_by(name: 'Leica L').id,
      name: 'Summitar',
      mm: 50,
      f: 2.0,
      close_up: false,
      note: '丸絞り'
    )
    @lens = LensOnPage.edit
  end

  context 'Input valid attributes' do
    background do
      @lens.name = 'Summicron'
      @lens.note = '沈胴'
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
      @lens.mm = nil
      @lens.confirm
    end

    scenario { expect(@lens).to have_edit_form }
    scenario { expect(@lens).to have_error_on(:mm) }
  end
end
