module AreYouSure
  module ActionViewExtensions
    module FormHelper

      def are_you_sure_form_for(model, options={}, &block)
        options[:builder] = form_builder_class(model)
        form_for(model, options, &block)
      end

    private

      def form_builder_class(model)
        if model.should_confirm? or model.errors.any?
          InputFormBuilder
        else
          ConfirmFormBuilder
        end
      end
    end
  end
end
