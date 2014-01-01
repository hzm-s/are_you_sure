class Lens < ActiveRecord::Base
  validates_presence_of :registered_at, :mfr_id, :mount_id, :name, :mm, :f, :note
end
