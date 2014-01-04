module AreYouSure
  module Confirmable

    def prepare_confirmation(confirmed, session)
      @are_you_sure_confirmed = confirmed
      @are_you_sure_session = session
    end

    def fill_confirmed_attributes
      self.attributes = @are_you_sure_session[:model_attributes]
      clear_attributes_cache
    end

    def save_if_confirmed
      confirm_with_persist { self.save }
    end

    def update_if_confirmed(attributes)
      self.attributes = attributes
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
      @are_you_sure_confirmed == 'confirmed'
    end

    def should_confirm?
      @are_you_sure_confirmed.nil?
    end

  private

    def confirm_with_persist
      return false unless self.valid?
      if confirmed?
        clear_attributes_cache
        yield
      else
        @are_you_sure_session[:model_attributes] = self.attributes
        false
      end
    end

    def clear_attributes_cache
      @are_you_sure_session[:model_attributes] = nil
    end
  end
end
