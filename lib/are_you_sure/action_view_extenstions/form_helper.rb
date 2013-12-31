module AreYouSure
  module ActionViewExtensions
    module FormHelper

      def are_you_sure_form_for(model_with_confirmation, options={}, &block)
        options[:as] = model_with_confirmation.model_class_key
        options[:builder] = model_with_confirmation.form_builder_class
        form_for(model_with_confirmation.model, options, &block)
      end
    end
  end
end

ActionView::Base.send(:include, AreYouSure::ActionViewExtensions::FormHelper)
