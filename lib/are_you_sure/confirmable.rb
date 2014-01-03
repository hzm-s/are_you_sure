module AreYouSure
  module Confirmable

    def confirmed=(confirmed)
      @are_you_sure_confirmed = confirmed
    end

    def save_if_confirmed
      do_if_valid_and_confirmed do
        self.save
      end
    end

    def update_if_confirmed(attributes)
      self.attributes = attributes
      do_if_valid_and_confirmed do
        self.update(attributes)
      end
    end

    def update_attributes_if_confirmed(attributes)
      self.attributes = attributes
      do_if_valid_and_confirmed do
        self.update_attributes(attributes)
      end
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

    def do_if_valid_and_confirmed
      return false unless self.valid?
      return false unless confirmed?
      yield
    end
  end
end
