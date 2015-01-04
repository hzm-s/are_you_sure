module AreYouSure
  module Confirmable

    def save_if_confirmed
      confirm_with_persist { self.save }
    end

    def update_if_confirmed(attributes)
      self.attributes = attributes unless confirmed?
      confirm_with_persist { self.update(attributes) }
    end

    def update_attributes_if_confirmed(attributes)
      self.attributes = attributes
      confirm_with_persist { self.update_attributes(attributes) }
    end

    def update_attribute_if_confirmed(name, value)
      update_attributes_if_confirmed(name => value)
    end

    def confirmed?
      confirmed == 'confirmed'
    end

    def should_confirm?
      confirmed.nil?
    end

  private

    def confirm_with_persist
      return false unless self.valid?
      if confirmed?
        clear_attributes_cache
        yield
      else
        session_store[:model_attributes] = self.attributes
        false
      end
    end
  end
end
