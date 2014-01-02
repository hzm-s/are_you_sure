module AreYouSure
  module Confirmable

    def confirmed=(confirmed)
      @confirmed = confirmed
    end

    def save_if_confirmed
      do_if_valid_and_confirmed do
        self.save
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
      @confirmed == 'confirmed'
    end

    def form_builder_class
      if @confirmed.nil? or self.errors.any?
        InputFormBuilder
      else
        ConfirmFormBuilder
      end
    end

  private

    def do_if_valid_and_confirmed
      return false unless self.valid?
      return false unless confirmed?
      yield
    end
  end
end
