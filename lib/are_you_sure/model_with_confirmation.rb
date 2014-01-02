module AreYouSure
  class ModelWithConfirmation
    attr_accessor :model

    def initialize(confirmed=nil)
      @confirmed = confirmed
    end

    def model_class_key
      @model_class_key ||= @model.class.to_s.underscore.to_sym
    end

    def save
      do_if_valid_and_confirmed do
        @model.save
      end
    end

    def update_attributes(attributes)
      @model.attributes = attributes
      do_if_valid_and_confirmed do
        @model.update_attributes(attributes)
      end
    end

    def update_attribute(name, value)
      update_attributes(name => value)
    end

    def confirmed?
      @confirmed == 'confirmed'
    end

    def form_builder_class
      if @confirmed.nil? or @model.errors.any?
        InputFormBuilder
      else
        ConfirmFormBuilder
      end
    end

    def method_missing(method, *args, &block)
      if @model.respond_to?(method)
        @model.send(method, *args, &block)
      else
        super
      end
    end

    def respond_to_missing?(method, include_private=false)
      @model.respond_to?(method) || super
    end

  private

    def do_if_valid_and_confirmed
      return false unless @model.valid?
      return false unless confirmed?
      yield
    end
  end
end
