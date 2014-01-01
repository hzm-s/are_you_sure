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
      return false unless @model.valid?
      return false unless confirmed?
      @model.save
    end

    def update_attributes(attributes)
      @model.attributes = attributes
      return false unless @model.valid?
      return false unless confirmed?
      @model.update_attributes(attributes)
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
      return super unless @model.respond_to?(method)
      @model.send(method, *args, &block)
    end
  end
end
