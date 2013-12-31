module AreYouSure
  class ModelWithConfirmation
    attr_reader :model_class_key, :model

    def initialize(model_class, model_params={}, params={})
      @model_class_key = model_class.to_s.underscore.to_sym
      @form_mode = params.delete(:form_mode) || 'input'
      @confirmed = params.delete(:confirmed)
      @model = model_class.new(model_params)
    end

    def save
      return false unless @model.valid?
      return false unless @confirmed
    end

    def form_builder_class
      case @form_mode
      when 'input'
        InputFormBuilder
      when 'confirm'
        ConfirmFormBuilder
      else
        InputFormBuilder
      end
    end
  end
end
