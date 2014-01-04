module AreYouSure
  module Confirmable

    def prepare_confirmation(confirmed)
      @are_you_sure_confirmed = confirmed
    end

    def save_if_confirmed
      do_if_can_persist { self.save }
    end

    def update_if_confirmed(attributes)
      self.attributes = attributes
      do_if_can_persist { self.update(attributes) }
    end

    def update_attributes_if_confirmed(attributes)
      self.attributes = attributes
      do_if_can_persist { self.update_attributes(attributes) }
    end

    def update_attribute_if_confirmed(name, value)
      update_attributes_if_confirmed(name => value)
    end

    def confirmed?
      @are_you_sure_confirmed == 'confirmed'
    end

    def should_confirm?
      @are_you_sure_confirmed.nil?
    end

  private

    def do_if_can_persist
      return false unless self.valid?
      return false unless confirmed?
      yield
    end
  end
end
