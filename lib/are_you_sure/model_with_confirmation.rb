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
    end

    def confirmed?
      @confirmed == true
    end

    def form_builder_class
      if @confirmed.nil?
        InputFormBuilder
      else
        ConfirmFormBuilder
      end
    end
  end
end
