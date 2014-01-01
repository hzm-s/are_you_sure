class LensOnPage < Struct.new(:registered_at, :mfr, :mount, :name, :mm, :f, :close_up, :note)
  extend Capybara::DSL
  include LensInputtable
  include LensConfirmationHelper

  def self.edit
    lens = Lens.last
    new(
      lens.registered_at,
      MFR.find(lens.mfr_id),
      Mount.find(lens.mount_id),
      lens.name,
      lens.mm,
      lens.f,
      lens.close_up,
      lens.note
    ).tap do |me|
      visit "#{lens.id}/edit"
    end
  end

  def initialize(*args)
    super
    visit "lenses/new"
  end

  def registered_datetime
    registered_at.strftime("%Y-%m-%d %H:%M")
  end

  def close_up_state
    close_up ? 'available' : 'unavailable'
  end

  def has_error_on?(name)
    all('li').collect {|li| li.text }.any? {|t| t =~ /#{name}/i }
  end

  def create
    click_button 'Create'
  end

  def update
    click_button 'Update'
  end

  def cancel
    click_link 'Cancel'
  end

  def has_new_form?
    has_css?('form#new_lens')
  end

  def has_edit_form?
    has_css?('form#edit_lens')
  end
end
