class LensOnPage < Struct.new(:registered_at, :mfr, :mount, :name, :mm, :f, :close_up, :note, :id)
  extend Capybara::DSL
  include LensFormHelper
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
      lens.note,
      lens.id
    ).tap do |me|
      visit "#{lens.id}/edit"
    end
  end

  def initialize(*args)
    super
    self.class.visit "lenses/new"
  end

  def registered_datetime
    registered_at.strftime("%Y-%m-%d %H:%M")
  end

  def close_up_state
    close_up ? 'available' : 'unavailable'
  end
end
