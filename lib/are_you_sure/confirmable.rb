module AreYouSure
  module Confirmable

    def prepare_confirmation(confirmed, cache)
      @are_you_sure_confirmed = confirmed
      @are_you_sure_cache = cache
    end

    def fill_attributes
      if @are_you_sure_cache.stored?
        self.attributes = @are_you_sure_cache.retrieve
      end
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
      forgot_attributes
      return false unless self.valid?
      memorize_attributes
      return false unless confirmed?
      yield
      forgot_attributes
    end

    def memorize_attributes
      @are_you_sure_cache.store(self.attributes)
    end

    def forgot_attributes
      @are_you_sure_cache.clear
    end
  end
end
